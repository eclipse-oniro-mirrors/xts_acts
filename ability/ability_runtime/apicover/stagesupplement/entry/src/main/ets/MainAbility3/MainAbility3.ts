import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';

var printLog3 = "Stage:MainAbility3:";
var listPush3 = "Stage_MainAbility3_";
export default class MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog3 + "onCreate")

        let launchWant = this.launchWant
        let lastRequestWant = this.lastRequestWant
        var CommonEventPublishData = {
            parameters: {
                launchWant: launchWant,
                lastRequestWant: lastRequestWant,
                launchReason: launchParam.launchReason,
                lastExitReason: launchParam.lastExitReason
            }
        }
        commonEvent.publish(listPush3 + "onCreate", CommonEventPublishData, (err) => {
            console.info(printLog3 + listPush3 + "onCreate");
        });

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog3 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog3 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        commonEvent.publish(listPush3 + "onDestroy", (err) => {
            console.info(printLog3 + listPush3 + "onDestroy");
        });
        setTimeout(()=>{
          console.info(printLog3 + "onDestroy")
      }, 1000)
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog3 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog3 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog3 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog3 + "onBackground")
    }
};
