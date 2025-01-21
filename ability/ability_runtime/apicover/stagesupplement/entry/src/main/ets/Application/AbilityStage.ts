import AbilityStage from "@ohos.app.ability.AbilityStage"
import commonEvent from '@ohos.commonEvent';
export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.info("[Demo] MyAbilityStage onCreate")
        let directions = this.context.config.direction
        var CommonEventPublishData = {
            parameters: {
                "config": directions
            }
        }
        commonEvent.publish("AbilityStage_StartAbility", CommonEventPublishData, (err) => {
            console.info("AbilityStage_StartAbility onCreate");
        });
    }
}