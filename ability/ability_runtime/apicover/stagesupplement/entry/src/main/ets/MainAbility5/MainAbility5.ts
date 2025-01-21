import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';

var printLog5 = "Stage:MainAbility5:";
var listPush5 = "Stage_MainAbility5_";
export default class MainAbility5 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog5 + "onCreate")

        // @ts-ignore
        var isTerminating = this.context.isTerminating()
        var createIsTerminating = {
            parameters: {
                isTerminating: isTerminating
            }
        }
        commonEvent.publish(listPush5 + "onCreate", createIsTerminating, (err) => {
            console.info(printLog5 + listPush5 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog5 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog5 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog5 + "onDestroy")

        // @ts-ignore
        var isTerminating = this.context.isTerminating()
        var destroyIsTerminating = {
            parameters: {
                isTerminating: isTerminating
            }
        }
        commonEvent.publish(listPush5 + "onDestroy", destroyIsTerminating, (err) => {
            console.info(printLog5 + listPush5 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog5 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog5 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog5 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog5 + "onBackground")
    }
};
