import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

var printLog9 = "Stage:MainAbility9:";
var listPush9 = "Stage_MainAbility9_";
var lifeList9 = [];
export default class MainAbility9 extends Ability {
    onCreate(want, launchParam) {
        console.info(printLog9 + "onCreate")

        lifeList9 = []
        lifeList9.push(listPush9 + "onCreate")

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.info(printLog9 + "terminateSelf data = " + JSON.stringify(data));
            }).catch((err) => {
                console.info(printLog9 + "terminateSelf err = " + JSON.stringify(err));
            });
        }, 3000)
    }

    onDestroy() {
        console.info(printLog9 + "onDestroy")

        lifeList9.push(listPush9 + "onDestroy")

        var lifeList = {
            parameters: {
                lifeList: lifeList9
            }
        }
        commonEvent.publish(listPush9 + "onDestroy", lifeList, (err) => {
            console.info(printLog9 + listPush9 + "onDestroy");
        });

        setTimeout(()=>{
          console.info(`${printLog9} onDestroy end`);
      }, 1000)
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info(printLog9 + "onWindowStageCreate")

        lifeList9.push(listPush9 + "onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info(printLog9 + "onWindowStageDestroy")

        lifeList9.push(listPush9 + "onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.info(printLog9 + "onForeground")

        lifeList9.push(listPush9 + "onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.info(printLog9 + "onBackground")

        lifeList9.push(listPush9 + "onBackground")
    }

    onWindowStageRestore(windowStage) {
        console.info(printLog9 + "onWindowStageRestore")

        lifeList9.push(listPush9 + "onWindowStageRestore")
    }

    onNewWant() {
        console.info(printLog9 + "onNewWant")

        lifeList9.push(listPush9 + "onNewWant")
    }

    onContinue(wantParam : {[key: string]: any}) {
        console.info(printLog9 + "onContinue")

        lifeList9.push(listPush9 + "onContinue")

        commonEvent.publish(listPush9 + "onContinue", (err) => {
            console.info(printLog9 + listPush9 + "onContinue");
        });

        return AbilityConstant.OnContinueResult.AGREE
    }
};
