import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility7 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility7 onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        console.log("[Demo] MainAbility7 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility7 onWindowStageCreate")
        globalThis.ability7context = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility7_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility7 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility7 onForeground")

        var listKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                listKey.push(abilityName + " onAbilityCreate");
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                listKey.push(abilityName + " onWindowStageCreate");
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
                listKey.push(abilityName + " onAbilityForeground");
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                listKey.push(abilityName + " onAbilityBackground");
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                listKey.push(abilityName + " onWindowStageDestroy");
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                listKey.push(abilityName + " onAbilityDestroy");
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                listKey.push(abilityName + " onAbilityContinue");
            }
        }
        globalThis.ApplicationContext7 = globalThis.ability7context.getApplicationContext();
        var callBackId = globalThis.ApplicationContext7.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        setTimeout(() => {
            globalThis.mainAbility7ListKey = listKey
            globalThis.mainAbility7CallBackId = callBackId
            console.log("listKey is :" + listKey);
            console.log("callBackId is :" + callBackId);
        }, 3000)

    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility7 onBackground")
    }
};
