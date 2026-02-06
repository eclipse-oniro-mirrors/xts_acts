import { Level, Size, TestType, beforeAll, describe, it, beforeEach } from '../../../hypium/index'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerPart2() {
  describe('webViewControllerPart2', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsaceopenwebpageenhancedtestthree.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")

    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("webViewControllerPart2 beforeEach start");
    })

    /**
     * @tc.name   testGetCustomUserAgentStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETCUSTOMUSERAGENT_0100
     * @tc.desc   test getCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCustomUserAgentStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent("testGetCustomUserAgent001", 10)
      await Utils.msSleep(4000);
      Utils.registerEvent("testGetCustomUserAgent001", true, 37018, done);
      await Utils.msSleep(3000);
      let driver: Driver = Driver.create();
      await Utils.msSleep(3000);
      let button = await driver.findComponent(ON.id('WebViewControllerPart2Button'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(2000);
      done();
    })
  })
}
