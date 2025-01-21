import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.context = this.context;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("[Demo] MainAbility onDestroy")
    }

    async onWindowStageCreate(windowStage) {
        console.log("[Demo] MainAbility onWindowStageCreate windowStage=" + windowStage)
        globalThis.windowStage = windowStage
        globalThis.abilityContext = this.context
        windowStage.setUIContent(this.context, "MainAbility/pages/index/index", null)
    }

    onWindowStageDestroy() {
        //Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};