import AbilityStage from "@ohos.app.ability.AbilityStage"
import Logger from '../pages/model/Logger'

export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        Logger.info('[MyAbilityStage]', 'MyAbilityStage onCreate')
    }
}