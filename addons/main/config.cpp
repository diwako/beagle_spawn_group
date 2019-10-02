#include "script_component.hpp"
    class CfgPatches {
        class ADDON {
            name = COMPONENT;
            units[] = {};
            weapons[] = {};
            requiredVersion = REQUIRED_VERSION;
            requiredAddons[] = {"cba_main"};
            author = "diwako";
            VERSION_CONFIG;
        };
    };

#include "CfgEventHandlers.hpp"