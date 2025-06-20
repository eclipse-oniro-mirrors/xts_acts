/*
 * Copyright (C) 2024 HiHope Open Source Organization
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';
import { bundleManager, common, Context, Want } from '@kit.AbilityKit';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}
let info: string

export default function AbilityRuntime2_Test() {
  describe('ACTS_EmbeddedUIExtension_Test2', () => {
    const TAG: string = 'EmbeddedUIExtension';
    let context: common.UIAbilityContext

    beforeAll(() => {
      context = AppStorage.get<Context>('abilityContext') as common.UIAbilityContext
      try {
         info = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
        console.log(TAG, JSON.stringify(info));
      } catch (e) {
        console.log('getSync unexpected error: ',TAG + e);
      }
    })
    afterEach(() => {
      if (info == 'true') {
        router.back()
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3100
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3100
     * @tc.desc Enable EmbeddedUIExtension for multiple instances of bundles in UIAbility of different bundles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3100', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_3100'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['ExtensionDefault']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'ExtensionDefault') {
              try {
                expect(100018).assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:跳转失败`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK`)
                });
                done();
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/Assist3100'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3300
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3300
     * @tc.desc Launch an EmbeddedUIExtension instance for multiple instances in UIAbility of different bundles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3300', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_3300'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['ExtensionDefault']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'ExtensionDefault') {
              try {
                expect(100018).assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:跳转失败`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK`)
                });
                done();
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/Assist3300'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0500
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0500
     * @tc.desc Verify that EmbeddedUIExtension failed to pull up EmbeddedUIExtension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0500', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_0500'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['reason']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'reason') {
              try {
                expect(100013).assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}ability:success`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK`)
                });
                done();
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/NestedPullUp0500'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0300
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0300
     * @tc.desc Verify the lifecycle callback after terminateSelfWithResult is called after EmbeddedUIExtension is started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0300', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_0300'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['OnBackground1', 'OnDestroy1', 'OnSessionDestroy1']
        }
        let NumberA: string = ''
        let NumberB: string = ''
        let NumberC: string = ''
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'OnBackground1') {
              NumberA = commonEventData.parameters?.data
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK1:${NumberA}`)
            }
            if (commonEventData.event == 'OnDestroy1') {
              NumberB = commonEventData.parameters?.data
              commonEventManager.unsubscribe(subscribe, (err, data) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK2:${NumberB}`)
              });
              try {
                expect(NumberA).assertEqual('333')
                expect(NumberB).assertEqual('222')
                expect(NumberC).assertEqual('111')
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}error:${error}`)
              }
            }
            if (commonEventData.event == 'OnSessionDestroy1') {
              NumberC = commonEventData.parameters?.data
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK3:${NumberC}`)
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/SameBundle0300'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0200
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0200
     * @tc.desc Verify that the Lifecycle callback that calls terminateSelf after EmbeddedUIExtension starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0200', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_0200'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['OnBackground', 'OnDestroy', 'OnSessionDestroy']
        }
        let NumberA: string = ''
        let NumberB: string = ''
        let NumberC: string = ''
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'OnBackground') {
              NumberA = commonEventData.parameters?.data
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK1:${NumberA}`)
            }
            if (commonEventData.event == 'OnDestroy') {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK2${NumberA},${NumberC}`)
              NumberB = commonEventData.parameters?.data
              try {
                expect(NumberA).assertEqual('OnBackground')
                expect(NumberB).assertEqual('OnDestroy')
                expect(NumberC).assertEqual('OnSessionDestroy')
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK2:${NumberB}`)
                  done()
                });
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}sdasdaerror:${error}`)
                done()
              }
            }
            if (commonEventData.event == 'OnSessionDestroy') {
              NumberC = commonEventData.parameters?.data
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK3:${NumberC}`)
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/SameDefault0200'
          }).then(()=>{
            console.log(`${TEST_SUITE_NAME},success`)
          }).catch((error:BusinessError)=>{
            console.log(`${TEST_SUITE_NAME}errorcode:${error.code},errormsg:${error.message}`)
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2100
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2100
     * @tc.desc Enum Validation for ExtensionType: EMBEDDED_UI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2100', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_2100'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        try {
          let codeNum: Number = bundleManager.ExtensionAbilityType.EMBEDDED_UI
          expect(codeNum).assertEqual(21);
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}Embedded_ui:${JSON.stringify(bundleManager.ExtensionAbilityType.EMBEDDED_UI)}`)
          await sleep(2000);
          done();
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3400
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3400
     * @tc.desc Nesting of Embedded UI Extensions is not allowed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3400', 0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_3400'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      }else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedUIExtension_Pull']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedUIExtension_Pull') {
              try {
                expect(commonEventData.parameters?.data).assertEqual(100013);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:跳转失败`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK`)
                });
                done();
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
            }
          })
        })
        context = AppStorage.get<Context>('abilityContext') as common.UIAbilityContext
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start ablilitysdasd err : ${JSON.stringify(context)}`);
        let want1: Want = {
          deviceId: '',
          bundleName: 'com.example.act_embeddeduiextension',
          abilityName: 'EntryAbility',
        }
        try {
          context.startAbility(want1).then(async (AbilityResult) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} start ability successful,result: ${JSON.stringify(AbilityResult)}`);
            hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}startAbilityForResult`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start ablility err : ${err}`);
            expect().assertFail();
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
          expect().assertFail();
        }
      }
    })
  })
}