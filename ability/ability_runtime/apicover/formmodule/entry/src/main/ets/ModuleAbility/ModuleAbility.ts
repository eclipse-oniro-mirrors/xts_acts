import UIAbility from '@ohos.app.ability.UIAbility'
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class ModuleAbility extends UIAbility {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        globalThis.abilityCallee = this.callee;
    }

    onDestroy() {
        console.log("[Demo] MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onWindowStageRestore(windowStage) {
        console.log("[Demo] MainAbility onWindowStageRestore")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }

    onContinue(wantParam) {
        console.log("[Demo] MainAbility onContinue")
        return AbilityConstant.OnContinueResult.AGREE;
    }

    onConfigurationUpdate(configuration) {
        console.log('[Demo] MainAbility onConfigurationUpdate: ' + JSON.stringify(configuration));
    }

    onDump(param) {
        console.log("[Demo] MainAbility onDump: " + JSON.stringify(param))
        return ["MainAbility"]
    }
};
