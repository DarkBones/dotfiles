# Karabiner Elements Documentation

On macs, I swap Ctrl and Cmd in Karabiner. But in the Terminal (Wezterm), I still want to use Ctrl instead of Cmd for vim.

To achieve this:
1. Go to Karabiner Elements
2. Add a complex modification
3. Add the following script:

```
{
    "description": "Swap Command and Control in WezTerm with workspace shortcuts exception",
    "manipulators": [
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "left_control",
                "modifiers": { "optional": ["any"] }
            },
            "to": [{ "key_code": "left_command" }],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "left_command",
                "modifiers": { "optional": ["any"] }
            },
            "to": [{ "key_code": "left_control" }],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "1",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "1",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "2",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "2",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "3",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "3",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "4",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "4",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "5",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "5",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "6",
                "modifiers": {
                    "mandatory": ["left_command"]
                }
            },
            "to": [
                {
                    "key_code": "6",
                    "modifiers": ["left_control"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "6",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "6",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "7",
                "modifiers": {
                    "mandatory": ["left_control", "left_option"]
                }
            },
            "to": [
                {
                    "key_code": "7",
                    "modifiers": ["left_command", "left_option"]
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "bundle_identifiers": [
                        "^com\\.github\\.wez\\.wezterm$",
                        "^com\\.mitchellh\\.ghostty$",
                        "^com\\.net\\.kovidgoyal\\.kitty$"
                    ],
                    "type": "frontmost_application_if"
                }
            ],
            "from": {
                "key_code": "v",
                "modifiers": {
                    "mandatory": ["left_control"]
                }
            },
            "to": [
                {
                    "key_code": "v",
                    "modifiers": ["left_command"]
                }
            ],
            "type": "basic"
        }
    ]
}
```

