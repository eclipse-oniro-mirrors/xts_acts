import AbilityStage from "@ohos.app.ability.AbilityStage"

export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.log("[Demo] MyAbilityStage onCreate")
        globalThis.stageContext = this.context;
    }

    onAcceptWant(want) {
        console.log("[Demo] MyAbilityStage onAcceptWant called want:" + JSON.stringify(want));
        let abilityId = want.parameters.startId.toString();
        return abilityId;
    }

    onConfigurationUpdate(configuration) {
        console.log('[Demo] MyAbilityStage onConfigurationUpdate:' + JSON.stringify(configuration));
    }
}