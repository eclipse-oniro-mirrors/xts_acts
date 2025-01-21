import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';

var printLog1 = "Stage:MainAbility:";
var listPush1 = "Stage_MainAbility_";
var launchWant
var lastRequestWant
export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog1 + "onCreate")

        launchWant = this.launchWant
        lastRequestWant = this.lastRequestWant
        commonEvent.publish(listPush1 + "onCreate", (err) => {
            console.info(printLog1 + listPush1 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog1 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog1 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 6000)
    }

    onDestroy() {
        console.info(printLog1 + "onDestroy")

        commonEvent.publish(listPush1 + "onDestroy", (err) => {
            console.info(printLog1 + listPush1 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog1 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog1 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog1 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog1 + "onBackground")
    }

    dump(param) {
        console.info(printLog1 + "dump = " + JSON.stringify(param))
        var CommonEventPublishData = {
            parameters: {
                dumpParam: param,
                lastRequestWant: lastRequestWant,
                launchWant: launchWant
            }
        }
        commonEvent.publish(listPush1 + "Dump", CommonEventPublishData, (err) => {
            console.info(printLog1 + listPush1 + "Dump");
        });

        return ["MainAbility"]
    }
};
