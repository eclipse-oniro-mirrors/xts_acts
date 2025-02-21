import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';

var printLog4 = "Stage:MainAbility4:";
var listPush4 = "Stage_MainAbility4_";
export default class MainAbility4 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog4 + "onCreate")

        let screenDensity = this.context.config.screenDensity
        var CommonEventPublishData = {
            parameters: {
                screenDensity: screenDensity
            }
        }
        commonEvent.publish(listPush4 + "onCreate", CommonEventPublishData, (err) => {
            console.info(printLog4 + listPush4 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog4 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog4 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog4 + "onDestroy")

        commonEvent.publish(listPush4 + "onDestroy", (err) => {
            console.info(printLog4 + listPush4 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog4 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog4 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog4 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog4 + "onBackground")
    }
};
