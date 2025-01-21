import Ability from '@ohos.app.ability.UIAbility'
import {
    UiComponent,
    UiDriver,
    Component,
    Driver,
    UiWindow,
    ON,
    BY,
    MatchPattern,
    DisplayRotation,
    ResizeDirection,
    WindowMode,
    PointerMatrix,
} from "@ohos.UiTest";
export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("[Demo] MainAbility onDestroy")
    }

    async onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability


        // var context = this.context

        // let array: Array<string> = ["ohos.permission.MEDIA_LOCATION", "ohos.permission.READ_MEDIA", "ohos.permission.WRITE_MEDIA"];
        // //requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
        // context.requestPermissionsFromUser(array).then(async function (data) {
        //     console.log("data type:" + JSON.stringify(data));
        //     console.log("data:" + data);
        //     console.log("data permissions:" + data.permissions);
        //     console.log("data result:" + data.authResults);
        // }, (err) => {
        //     console.error('Failed to start ability', err.code);
        // });
        // console.info("getPermission 1");
        // await new Promise((res) => setTimeout(res, 200));


        // let driver = Driver.create();
        // console.info("getPermission 2");
        // console.info(`driver is ${JSON.stringify(driver)}`);
        // await new Promise((res) => setTimeout(res, 200));

        // let button = await driver.findComponent(ON.text("允许"));

        // while (button) {
        //     console.info(`button is ${JSON.stringify(button)}`);
        //     await new Promise((res) => setTimeout(res, 200));
        //     await button.click();
        //     button = await driver.findComponent(ON.text("允许"));
        // }
        // console.info("getPermission 3");

        console.log("[Demo] MainAbility onWindowStageCreate windowStage=" + windowStage)
        globalThis.windowStage = windowStage
        globalThis.abilityContext = this.context
        windowStage.setUIContent(this.context, "MainAbility/pages/index/index", null)
        console.info("getPermission 4");

    }

    onWindowStageDestroy() {
        //Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};