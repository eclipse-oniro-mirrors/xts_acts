import { describe, it, expect, afterEach, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { bundleManager } from '@kit.AbilityKit';
import application from '@ohos.app.ability.application';

let ACTS_CallFunction: commonEventManager.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300']
};
let ACTS_CallFunction2: commonEventManager.CommonEventSubscribeInfo = {
  events: ['Instance_0100']
};
const TAG = 'ActsGetApplicationNewTest';

let subscriber: commonEventManager.CommonEventSubscriber;

let driver = Driver.create();

console.log(TAG, driver);

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default function abilityTest() {
  describe('AbilityGetPreLoadTypeTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAppPreloadType_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetAppPreloadType_0100
     * @tc.desc   Call the global GetAppPreloadType function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetAppPreloadType_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.log(TAG, 'SUB_Ability_AbilityRuntime_GetAppPreloadType_0100 start');
        let preloadType = application.getAppPreloadType();
        expect(preloadType).assertEqual(application.AppPreloadType.UNSPECIFIED);
        done();
      } catch (err) {
        console.log('SUB_Ability_AbilityRuntime_GetAppPreloadType_0100 error: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

  })
}