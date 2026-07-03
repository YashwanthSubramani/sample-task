import pytest
import os
import sys

# Look at the application source directory
sys.path.append("/app/src")

def test_secure_config_loading():
    """Verify that configuration attributes load securely from environment properties."""
    os.environ["WEBHOOK_SECRET"] = "super-secret-key-123"
    try:
        import config
        assert config.get_webhook_secret() == "super-secret-key-123"
    except ImportError:
        assert False, "Could not find config module or get_webhook_secret function."

def test_missing_config_exception():
    """Verify that an initialization exception triggers if crucial keys are missing."""
    if "WEBHOOK_SECRET" in os.environ:
        del os.environ["WEBHOOK_SECRET"]
    
    with pytest.raises(Exception):
        import config
        config.reload_config()