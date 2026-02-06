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
import { common, Context } from '@kit.AbilityKit';
import { describe, beforeAll, it, expect, beforeEach, afterEach, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { data } from '@kit.TelephonyKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
import { EditableLeftIconType, router } from '@kit.ArkUI';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

let info: string


export default function AbilityRuntime_Test() {
  describe('ACTS_EmbeddedUIExtension_Test', () => {
    const TAG: string = 'EmbeddedUIExtension';
    beforeAll(() => {
      try {
        info = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model')
        console.log('sdas',info)
      } catch (e) {
        console.log('getSync unexpected error: ' + e);
      }
    })

    afterEach(() => {
      if (info =='true') {
        router.back()
      }
    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4600
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4600
     * @tc.desc Start the EmbeddedUIExtension instance of multiple instances and specify the process name of EmbeddedUIExtension with different capabilities of the same bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4600', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4600';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['Start_Fail']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'Start_Fail') {
              try {
                expect(100018).assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}unsubscribe OK`)
                });
                done();
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} start fail : ${error}`);
                expect().assertTrue()
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}:unsubscribe OK`)
                });
                done();
              }
            }
          })
        })
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance4600'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        await sleep(2000)
        try {
          let driver = Driver.create();
          await driver.delayMs(1000);
          let button = await driver.findComponent(ON.id('EmbeddedUIExtension_4600'));
          await button.click();
          await driver.delayMs(1000);
        } catch (e) {
          hilog.info(0x0000, TAG, '%{public}s', TEST_SUITE_NAME + 'Driver error ' + e?.message);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2700
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2700
     * @tc.desc Initiate EmbeddedUIExtension for multiple instances of bundles in UIAbility of the same bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2700', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2700';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility3']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility3') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:success`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
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
            url: 'testability/pages/Bundle2700'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2900
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2900
     * @tc.desc Initiate the EmbeddedUIExtension of multiple instances in UIAbility with the same bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2900', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2900';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility4']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility4') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `Embedded_ui:Embedded_ui:success`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
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
            url: 'testability/pages/HostInstance2900'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2800
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2800
     * @tc.desc Launch a multi-instance embeddedUIExtension in UIAbility with the same bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2800', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2800';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility5']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility5') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
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
            url: 'testability/pages/Type2800'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2600
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2600
     * @tc.desc Launch the default multi-instance EmbeddedUIExtension in UIAbility with the same bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2600', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2600';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['default']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'default') {
              try {
                expect('default').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
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
            url: 'testability/pages/Default2600'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3200
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3200
     * @tc.desc Enable the type multi-instance EmbeddedUIExtension in UIAbility of different bundles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3200', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3200';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['ExtensionType']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'ExtensionType') {
              try {
                expect(100018).assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `Embedded_ui:跳转失败`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
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
            url: 'testability/pages/Type3200'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3000
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3000
     * @tc.desc The default multi-instance EmbeddedUIExtension is launched in UIAbility of different bundles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3000', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3000';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
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
                hilog.info(0x0000, TAG, '%{public}s', `Embedded_ui:跳转失败`)
                await sleep(2000);
                commonEventManager.unsubscribe(subscribe, (err, data) => {
                  hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
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
            url: 'testability/pages/Default3000'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2300
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2300
     * @tc.desc Launch the embeddedUIExtension of multiple instances of bundles in UIAbility of the same module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2300', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2300';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility_same_bundle']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility_same_bundle') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `Embedded_ui:Embedded_ui:success`)
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
            url: 'testability/pages/SameBundle2300'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2500
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2500
     * @tc.desc Launch an EmbeddedUIExtension instance for multiple instances in UIAbility of the same module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2500', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2500';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility_same_Instance']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility_same_Instance') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
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
            url: 'testability/pages/SameInstance2500'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2400
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2400
     * @tc.desc Launch the EmbeddedUIExtension of type multi-instance in UIAbility of the same module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2400', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2400';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility_same_Type']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility_same_Type') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
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
            url: 'testability/pages/SameType2400'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2200
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2200
     * @tc.desc Launch EmbeddedUIExtension without multiple instances in UIAbility of the same module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_2200', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_2200';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['EmbeddedAbility_same_Default']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'EmbeddedAbility_same_Default') {
              try {
                expect('onCreate').assertEqual(commonEventData.parameters?.data);
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}Embedded_ui:Embedded_ui:success`)
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
            url: 'testability/pages/SameDefault2200'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3800
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3800
     * @tc.desc Start EmbeddedUIExtension for multiple instances of a bundle and set hostInstance to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3800', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3800';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance3800'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes('process name [com.example.act_embeddeduiextension:embeddedUI]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3600
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3600
     * @tc.desc Start EmbeddedUIExtension for multiple instances of a bundle and set hostInstance to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3600', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3600';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance3600'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes('process name [com.example.act_embeddeduiextension:embeddedUI]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3500
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3500
     * @tc.desc Start EmbeddedUIExtension for multiple bundle instances and set hostInstance to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3500', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3500';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance3500'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes('process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityBundle3:')) {
                  count++;
                }
              }
              try {
                hilog.info(0x0000, TAG, '%{public}s', `${count} startType:Bundle`);
                expect(count).assertEqual(3)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3900
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3900
     * @tc.desc Start EmbeddedUIExtension for a bundle multi-instance instance and specify hostInstance as {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3900', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3900';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance3900'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes('process name [com.example.act_embeddeduiextension:embeddedUI]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3700
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3700
     * @tc.desc Start EmbeddedUIExtension for Bundle multi-instance and specify hostInstance as true for the string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_3700', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_3700';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstance3700'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes('process name [com.example.act_embeddeduiextension:embeddedUI]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4500
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4500
     * @tc.desc Start the EmbeddedUIExtension instance of a multi-instance instance and specify the process name of the EmbeddedUIExtension instance of another bundle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4500', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4500';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['Start_Fail']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'Start_Fail') {
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
            url: 'testability/pages/HostInstance4500'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4300
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4300
     * @tc.desc Start EmbeddedUIExtension for type multi-instance instance and set hostInstance to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4300', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4300';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstanceType4300'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes(' process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityType]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4100
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4100
     * @tc.desc Start EmbeddedUIExtension for type multi-instance instance and set hostInstance to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4100', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4100';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstanceType4100'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes(' process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityType]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4000
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4000
     * @tc.desc Start EmbeddedUIExtension for type multi-instance instance and set hostInstance to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4000', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4000';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstanceType4100'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes(' process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityType]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4400
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4400
     * @tc.desc Start EmbeddedUIExtension for type multi-instance and specify hostInstance as {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4400', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4400';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstanceType4400'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                if (record.includes(' process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityType]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4200
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4200
     * @tc.desc Start EmbeddedUIExtension for type multi-instance and specify hostInstance as true as the string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_4200', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME: string = 'UIEXtension_EmbeddedUIExtension_4200';
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let result: string = ''
        await sleep(2000)
        try {
          router.pushUrl({
            url: 'testability/pages/HostInstanceType4200'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
        try {
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
          let cmd = 'aa dump -r';
          abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          abilityDelegator.executeShellCommand(cmd, (error: BusinessError, data) => {
            if (error) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, error: ${JSON.stringify(error)}`);
            } else {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}executeShellCommand fail, executeShellCommand success, data: ${JSON.stringify(data)}`);
              result = JSON.stringify(data)
              const stdResult: string = JSON.parse(result).stdResult;
              const records = stdResult.split('AppRunningRecord');
              let count = 0;
              for (const record of records) {
                hilog.info(0x0000, TAG, '%{public}s',
                  `${TEST_SUITE_NAME}, data[i]: ${JSON.stringify(record)}`);
                if (record.includes(' process name [com.example.act_embeddeduiextension:EmbeddedUIExtAbilityType]')) {
                  count++;
                }
              }
              try {
                expect(count).assertEqual(1)
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} startType:Bundle`);
                done()
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${JSON.stringify(error)}`);
                done()
              }
            }
          });
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}  fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1100
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1100
     * @tc.desc Verify that the context call of EmbeddedUIExtension startAbilityForResult has options to start UIAbility of the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1100', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_1100'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility1100'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1200
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1200
     * @tc.desc Verify that the context of EmbeddedUIExtension calls the startAbilityForResult of the promise has options to start the UIAbility of the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1200', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_1200'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility1200'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1000
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1000
     * @tc.desc Verify that the context of EmbeddedUIExtension calls the startAbility of the promise has options to start the UIAbility of the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1000', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_1000'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility1000'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1300
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1300
     * @tc.desc Verify that the context call to startAbilityForResult of EmbeddedUIExtension can start UIAbility of the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */

    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_1300', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_1300'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility1300'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0800
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0800
     * @tc.desc Verify that EmbeddedUIExtension context calls startAbility can start UIAbility for the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0800', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_0800'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility0800'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0900
     * @tc.name SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0900
     * @tc.desc Verify that the EmbeddedUIExtension context call startAbility has options to start UIAbility for the current application
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIEXtension_EmbeddedUIExtension_0900', Level.LEVEL0, async (done: Function) => {
      const TEST_SUITE_NAME = 'UIEXtension_EmbeddedUIExtension_0900'
      if (info != 'false' && info != 'true') {
        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} config is error : ${JSON.stringify(info)}`)
        expect().assertFail()
        done
      }
      if (info == 'false') {
        done()
      } else {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['extensionStart']
        }
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}createSubscribe OK`);
          commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
            if (commonEventData.event == 'extensionStart') {
              try {
                expect('111').assertEqual(commonEventData.parameters?.data);
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
            url: 'testability/pages/StartAbility0900'
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME} router fail : ${error}`);
        }
      }
    })
  })
}
