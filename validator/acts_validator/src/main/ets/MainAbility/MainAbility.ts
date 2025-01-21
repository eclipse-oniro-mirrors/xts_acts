import Ability from '@ohos.app.ability.UIAbility'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        globalThis.dir=this.context.filesDir;
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
    }

    onDestroy() {
        console.log("[Demo] MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {

        console.log("[Demo] MainAbility onWindowStageCreate")
        let AtManager = abilityAccessCtrl.createAtManager();
        AtManager.requestPermissionsFromUser(this.context,['ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
        'ohos.permission.CAPTURE_SCREEN', 'ohos.permission.INTERNET', 'ohos.permission.CAMERA',
        'ohos.permission.MICROPHONE', 'ohos.permission.START_INVISIBLE_ABILITY']).then( () => {} );
        windowStage.loadContent('pages/index', (err, data) => {
            if (err.code) {
                console.error( 'Failed to load the content. Cause:' + JSON.stringify(err) );
                return;
            }
            console.info( 'Succeeded in loading the content. Data: ' + JSON.stringify(data) );
        });
    }

    onWindowStageDestroy() {
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        console.log("[Demo] MainAbility onBackground")
    }
};
