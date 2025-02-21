/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import inputMethodEngine from '@ohos.inputMethodEngine';
import subtype from '@ohos.InputMethodSubtype';
import commonEventManager from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest'
import deviceinfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base'

export default function inputMethodAbility() {
  describe('inputMethodAbility', () => {
    var inputServer = {
      packageName: '',
      methodId: '',
      name: '',
      id: '',
      extra: {}
    }

    var inputServerCopy = {
      packageName: '',
      methodId: '',
      name: '',
      id: '',
      extra: {}
    }

    let rectInfo;
    let textArea: Component;
    let driver = Driver.create();
    let dis = display.getDefaultDisplaySync();
    let inputDemoService: subtype;
    let inputMethodController = inputMethod.getController();

    beforeAll(async (done: Function) => {
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("====>beforeAll: switchInputMethod to: " + JSON.stringify(inputM));
      inputServer.packageName = inputM.packageName;
      inputServer.methodId = inputM.methodId;
      inputServer.name = inputM.packageName;
      inputServer.id = inputM.methodId;
      console.info("====>beforeAll inputMethodStageJSUnit start");
      inputDemoService = {
        id: 'inputStageService',
        label: '',
        name: 'com.acts.inputmethodengine.test',
        mode: 'lower',
        locale: '',
        language: '',
        icon: '',
        iconId: 0,
        extra: {},
      }
      try {
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        textArea = await driver.findComponent(ON.type('TextArea'));
        rectInfo = await textArea.getBounds();
        console.info('====>beforeAll inputMethodSwitch textArea rectInfo: ' + JSON.stringify(rectInfo));
        setTimeout(() => {
          runCmd()
          console.info("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype success");
          done();
        }, 2000)
      } catch (err) {
        console.info("====>beforeAll inputMethodStageJSUnit switchCurrentInputMethodSubtype failed");
      }
    })

    afterAll(async (done: Function) => {
      done();
    })

    async function runCmd() {
      let cursor_x = rectInfo.left + 20 + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.9);
      let cursor_y = rectInfo.top + 20 + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.9);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  inputMethodEngine_test_001
    * @tc.name   inputMethodEngine_test_001
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_001', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED;
      console.info("====>inputMethodEngine_test_001 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_002
    * @tc.name   inputMethodEngine_test_002
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_002', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_GO;
      console.info("====>inputMethodEngine_test_002 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_003
    * @tc.name   inputMethodEngine_test_003
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_003', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_SEARCH;
      console.info("====>inputMethodEngine_test_003 result:" + keyType);
      expect(keyType).assertEqual(3);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_004
    * @tc.name   inputMethodEngine_test_004
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_004', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_SEND;
      console.info("====>inputMethodEngine_test_004 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_005
    * @tc.name   inputMethodEngine_test_005
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_005', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_NEXT;
      console.info("====>inputMethodEngine_test_005 result:" + keyType);
      expect(keyType).assertEqual(5);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_006
    * @tc.name   inputMethodEngine_test_006
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_006', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_DONE;
      console.info("====>inputMethodEngine_test_006 result:" + keyType);
      expect(keyType).assertEqual(6);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_007
    * @tc.name   inputMethodEngine_test_007
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_007', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_PREVIOUS;
      console.info("====>inputMethodEngine_test_007 result:" + keyType);
      expect(keyType).assertEqual(7);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_008
    * @tc.name   inputMethodEngine_test_008
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_008', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_NULL;
      console.info("====>inputMethodEngine_test_008 result:" + keyType);
      expect(keyType).assertEqual(-1);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_009
    * @tc.name   inputMethodEngine_test_009
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_009', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_TEXT;
      console.info("====>inputMethodEngine_test_009 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_010
    * @tc.name   inputMethodEngine_test_010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_010', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_NUMBER;
      console.info("====>inputMethodEngine_test_010 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_011
    * @tc.name   inputMethodEngine_test_011
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_011', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_PHONE;
      console.info("====>inputMethodEngine_test_011 result:" + keyType);
      expect(keyType).assertEqual(3);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_012
    * @tc.name   inputMethodEngine_test_012
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_012', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_DATETIME;
      console.info("====>inputMethodEngine_test_012 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_013
    * @tc.name   inputMethodEngine_test_013
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_013', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_EMAIL;
      console.info("====>inputMethodEngine_test_013 result:" + keyType);
      expect(keyType).assertEqual(5);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_014
    * @tc.name   inputMethodEngine_test_014
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_014', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_URI;
      console.info("====>inputMethodEngine_test_014 result:" + keyType);
      expect(keyType).assertEqual(6);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_015
    * @tc.name   inputMethodEngine_test_015
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_015', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_PASSWORD;
      console.info("====>inputMethodEngine_test_015 result:" + keyType);
      expect(keyType).assertEqual(7);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_016
    * @tc.name   inputMethodEngine_test_016
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_016', 0, async (done: Function) => {
      let keyType = inputMethodEngine.FLAG_SELECTING;
      console.info("====>inputMethodEngine_test_016 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_017
    * @tc.name   inputMethodEngine_test_017
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_017', 0, async (done: Function) => {
      let keyType = inputMethodEngine.FLAG_SINGLE_LINE;
      console.info("====>inputMethodEngine_test_017 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_018
    * @tc.name   inputMethodEngine_test_018
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_018', 0, async (done: Function) => {
      let keyType = inputMethodEngine.DISPLAY_MODE_PART;
      console.info("====>inputMethodEngine_test_018 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_019
    * @tc.name   inputMethodEngine_test_019
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_019', 0, async (done: Function) => {
      let keyType = inputMethodEngine.DISPLAY_MODE_FULL;
      console.info("====>inputMethodEngine_test_019 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_020
    * @tc.name   inputMethodEngine_test_020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_020', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_ASCII;
      console.info("====>inputMethodEngine_test_020 result:" + keyType);
      expect(keyType).assertEqual(20);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_021
    * @tc.name   inputMethodEngine_test_021
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_021', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_NONE;
      console.info("====>inputMethodEngine_test_021 result:" + keyType);
      expect(keyType).assertEqual(0);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_022
    * @tc.name   inputMethodEngine_test_022
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_022', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_AUTO_CAP_CHARACTERS;
      console.info("====>inputMethodEngine_test_022 result:" + keyType);
      expect(keyType).assertEqual(2);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_023
    * @tc.name   inputMethodEngine_test_023
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_023', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_AUTO_CAP_SENTENCES;
      console.info("====>inputMethodEngine_test_023 result:" + keyType);
      expect(keyType).assertEqual(8);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_024
    * @tc.name   inputMethodEngine_test_024
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_024', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_AUTO_WORDS;
      console.info("====>inputMethodEngine_test_024 result:" + keyType);
      expect(keyType).assertEqual(4);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_025
    * @tc.name   inputMethodEngine_test_025
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_025', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_MULTI_LINE;
      console.info("====>inputMethodEngine_test_025 result:" + keyType);
      expect(keyType).assertEqual(1);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_026
    * @tc.name   inputMethodEngine_test_026
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_026', 0, async (done: Function) => {
      let keyType = inputMethodEngine.OPTION_NO_FULLSCREEN;
      console.info("====>inputMethodEngine_test_026 result:" + keyType);
      expect(keyType).assertEqual(10);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_027
    * @tc.name   inputMethodEngine_test_027
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_027', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_PASSWORD_SCREEN_LOCK;
      console.info("====>inputMethodEngine_test_027 result:" + keyType);
      expect(keyType).assertEqual(9);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_028
    * @tc.name   inputMethodEngine_test_028
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_028', 0, async (done: Function) => {
      let keyType = inputMethodEngine.PATTERN_PASSWORD_NUMBER;
      console.info("====>inputMethodEngine_test_028 result:" + keyType);
      expect(keyType).assertEqual(8);
      done();
    });

    /*
    * @tc.number  inputMethodEngine_test_029
    * @tc.name   inputMethodEngine_test_029
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_029', 0, async (done: Function) => {
      let keyType = inputMethodEngine.ENTER_KEY_TYPE_NEWLINE;
      console.info("====>inputMethodEngine_test_029 result:" + keyType);
      expect(keyType).assertEqual(8);
      done();
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_ExtendAction_0100
    * @tc.name   Sub_Misc_inputMethodEngine_ExtendAction_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethodEngine_ExtendAction_0100', 0, async (done: Function) => {
      let select_all = inputMethodEngine.ExtendAction.SELECT_ALL;
      console.info("====>Sub_Misc_inputMethodEngine_ExtendAction_0100 select_all:" + select_all);
      expect(select_all).assertEqual(0);
      let cut = inputMethodEngine.ExtendAction.CUT;
      console.info("====>Sub_Misc_inputMethodEngine_ExtendAction_0100 cut:" + cut);
      expect(cut).assertEqual(3);
      let copy = inputMethodEngine.ExtendAction.COPY;
      console.info("====>Sub_Misc_inputMethodEngine_ExtendAction_0100 copy:" + copy);
      expect(copy).assertEqual(4);
      let paste = inputMethodEngine.ExtendAction.PASTE;
      console.info("====>Sub_Misc_inputMethodEngine_ExtendAction_0100 paste:" + paste);
      expect(paste).assertEqual(5);
      done();
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_ExtendAction_0101
    * @tc.name   Sub_Misc_inputMethodEngine_ExtendAction_0101
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_getInputMethodAbility_001', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_getInputMethodAbility_001 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_getInputMethodAbility_001 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_getInputMethodAbility_001 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_getInputMethodAbility_001"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_getInputMethodAbility_001 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 1
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_getKeyboardDelegate_001
    * @tc.name   inputMethodAbility_test_getKeyboardDelegate_001
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_getKeyboardDelegate_001', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_getKeyboardDelegate_001"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_getKeyboardDelegate_001 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 2
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_028
    * @tc.name   inputMethodAbility_test_028
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_028', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_028 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_028 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_028 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_028 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_028 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_028 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_028 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_028 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_028"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_028 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_028 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 28
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_029
    * @tc.name   inputMethodAbility_test_029
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_029', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_029 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_029 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_029 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_029 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_029 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_029 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_029 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_029 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_029"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_029 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_029 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 29
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback)
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_030
    * @tc.name   inputMethodAbility_test_030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_030', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_030 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_030 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_030 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_030 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_030 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_030 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_030 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_030 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_030"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_030 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_030 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 30
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_031
    * @tc.name   inputMethodAbility_test_031
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_031', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_031 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_031 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_031 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_031 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_031 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_031 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_031 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_031 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_031"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_031 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_031 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 31
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_032
    * @tc.name   inputMethodAbility_test_032
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_032', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_032 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_032 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_032 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_032 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_032 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_032 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_032 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_032 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_032"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_032 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_032 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 32
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_033
    * @tc.name   inputMethodAbility_test_033
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_033', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_033 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_033 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_033 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_033 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_033 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_033 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_033 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_033 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_033"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_033 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_033 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 33
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_034
    * @tc.name   inputMethodAbility_test_034
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_034', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_034 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_034 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_034 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_034 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_034 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_034 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_034 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_034 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_034"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_034 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_034 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 34
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_035
    * @tc.name   inputMethodAbility_test_035
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_035', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_035 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_035 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_035 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_035 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_035 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_035 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_035 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_035 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_035"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_035 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_035 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 35
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_036
    * @tc.name   inputMethodAbility_test_036
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_036', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_036 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_036 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_036 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_036 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_036 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_036 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_036 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_036 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_036"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_036 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_036 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 36
          };
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_037
    * @tc.name   inputMethodAbility_test_037
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_037', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_037 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_037 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_037 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_037 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_037 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_037 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_037 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_037 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_037"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_037 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_037 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 37
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_038
    * @tc.name   inputMethodAbility_test_038
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_038', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_038 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_038 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_038 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_038 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_038 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_038 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_038 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_038 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_038"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_038 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_038 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 38
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_039
    * @tc.name   inputMethodAbility_test_039
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_039', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_039 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_039 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_039 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_039 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_039 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_039 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_039 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_039 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_039"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_039 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_039 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 39
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_040
    * @tc.name   inputMethodAbility_test_040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_040', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_040 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_040 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_040 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_040 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_040 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_040 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_040 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_040 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_040"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_040 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_040 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 40
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_041
    * @tc.name   inputMethodAbility_test_041
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_041', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_041 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_041 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_041 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_041 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_041 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_041 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_041 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_041 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_041"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_041 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_041 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 41
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_042
    * @tc.name   inputMethodAbility_test_042
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_042', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_042 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_042 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_042 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_042 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_042 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_042 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_042 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_042 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_042"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_042 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_042 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 42
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_043
    * @tc.name   inputMethodAbility_test_043
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_043', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_043 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_043 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_043 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_043 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_043 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_043 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_043 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_043 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_043"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_043 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_043 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 43
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_044
    * @tc.name   inputMethodAbility_test_044
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodEngine_test_044', 0, async (done: Function) => {
      let keyType = inputMethodEngine.WINDOW_TYPE_INPUT_METHOD_FLOAT;
      console.info("====>inputMethodEngine_test_044 result:" + keyType);
      expect(keyType).assertEqual(2105);
      done();
    });

    /*
    * @tc.number  inputMethodAbility_test_045
    * @tc.name   inputMethodAbility_test_045
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_045', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_045 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_045 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_045 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_045 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_045 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_045 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_045 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_045 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_045"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_045 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_045 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 45
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_046
    * @tc.name   inputMethodAbility_test_046
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_046', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_046 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_046 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_046 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_046 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_046 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_046 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_046 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_046 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_046"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_046 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_046 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 46
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_047
    * @tc.name   inputMethodAbility_test_047
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_047', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_047 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_047 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_047 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_047 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_047 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_047 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_047 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_047 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_047"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_047 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_047 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 47
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_048
    * @tc.name   inputMethodAbility_test_048
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_048', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_048 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_048 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_048 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_048 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_048 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_048 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_048 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_048 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_048"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_048 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_048 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 48
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_049
    * @tc.name   inputMethodAbility_test_049
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_049', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_049 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_049 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_049 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_049 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_049 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_049 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_049 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_049 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_049"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_049 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_049 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 49
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_050
    * @tc.name   inputMethodAbility_test_050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_050', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_050 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_050 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_050 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_050 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_050 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_050 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_050"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_050 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_050 subscriber finish")
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 50
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_070
    * @tc.name   inputMethodAbility_test_070
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_070', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_070 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_070 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_070 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_070 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_070 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_070 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_070 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_070 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t)
          }, 300)
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_070"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_070 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_070 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 70
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_071
    * @tc.name   inputMethodAbility_test_071
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_071', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_071 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_071 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_071 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_071 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_071 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_071 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_071 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_071 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t)
          }, 200)
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_071"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_071 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_071 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 71
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_072
    * @tc.name   inputMethodAbility_test_072
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_072', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_072 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_072 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_072 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_072 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_072 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_072 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_072 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_072 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(() => {
            runCmd();
            clearTimeout(t)
          }, 300)
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_072"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_072 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_072 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 72
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_073
    * @tc.name   inputMethodAbility_test_073
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_073', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_073 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_073 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_073 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_073 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_073 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_073 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_073 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_073 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t1 = setTimeout(async () => {
            await driver.triggerKey(2000);
            clearTimeout(t1);
          }, 300);
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_073"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_073 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_073 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 73
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_074
    * @tc.name   inputMethodAbility_test_074
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_074', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_074 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_074 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_074 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_074 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_074 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_074 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 1000);
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_074 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_074 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async () => {
            let inputMethodController = inputMethod.getInputMethodController();
            let windowId: number = 2000;
            await inputMethodController.setCallingWindow(windowId)
            clearTimeout(t)
          }, 200)
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_074"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_074 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_074 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 74
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_101
    * @tc.name   inputMethodAbility_test_101
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_101', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_101 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_101 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_101 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_101 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_101 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_101 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_101 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_101 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_101"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_101 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_101 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 101
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_102
    * @tc.name   inputMethodAbility_test_102
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_102', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_102 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_102 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_102 unSubscriberCallback finish")
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_102 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_102 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_102 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_102 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_102 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_102"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_102 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_102 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 102
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_103
    * @tc.name   inputMethodAbility_test_103
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_103', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_103 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_103 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_103 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_103 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_103 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_103 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_103 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_103 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_103"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_103 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_103 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 103
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_104
    * @tc.name   inputMethodAbility_test_104
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_104', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_104 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_104 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_104 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_104 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_104 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_104 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_104 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_104 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_104"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_104 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_104 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 104
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_105
    * @tc.name   inputMethodAbility_test_105
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_105', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_105 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_105 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_105 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_105 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_105 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_105 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_105 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_105 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_105"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_105 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_105 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 105
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  inputMethodAbility_test_106
    * @tc.name   inputMethodAbility_test_106
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_106', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_106 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_106 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_106 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_106 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>inputMethodAbility_test_106 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>inputMethodAbility_test_106 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_106 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_106 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_106"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_106 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_106 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 106
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_onSelectByRange_0110
    * @tc.name   Sub_Misc_inputMethod_onSelectByRange_0110
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_onSelectByRange_0110', 0, async (done: Function) => {

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_onSelectByRange_0110 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_onSelectByRange_0110 publishCallback failed:" + JSON.stringify(err));
        }
      }

      inputMethodController.on("selectByRange", async (range) => {
        console.info('====>Sub_Misc_inputMethod_onSelectByRange_0110 onSelectByRange start');
        inputMethodController.off("selectByRange");
        try {
          expect(range.start).assertEqual(0);
          expect(range.end).assertEqual(10);
          console.info('====>Sub_Misc_inputMethod_onSelectByRange_0110 Succeed onSelectByRange: ' +
          JSON.stringify(range));
          done();
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_onSelectByRange_0110 selectByRange success');
          done();
        }
      });

      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
        code: 110
      }
      commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_onSelectByMovement_0120
    * @tc.name   Sub_Misc_inputMethod_onSelectByMovement_0120
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_onSelectByMovement_0120', 0, async (done: Function) => {

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_onSelectByMovement_0120 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_onSelectByMovement_0120 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      inputMethodController.on("selectByMovement", async (movement) => {
        console.info('====>Sub_Misc_inputMethod_onSelectByMovement_0120 onSelectByMovement start');
        inputMethodController.off("selectByMovement");
        try {
          expect(movement.direction).assertEqual(2);
          console.info('====>Sub_Misc_inputMethod_onSelectByMovement_0120 Succeed onSelectByMovement: ' +
          JSON.stringify(movement));
          done();
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_onSelectByMovement_0120 onSelectByMovement catch err: ' +
          JSON.stringify(err));
          done();
        }
      });

      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
        code: 120
      }
      commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_offSelectByRange_0130
    * @tc.name   Sub_Misc_inputMethod_offSelectByRange_0130
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_offSelectByRange_0130', 0, async (done: Function) => {

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_offSelectByRange_0130 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_offSelectByRange_0130 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let count = 0;
      inputMethodController.on("selectByRange", async (movement) => {
        console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 offSelectByRange start');
        inputMethodController.off("selectByRange");
        count += 1;
        console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 Succeed offSelectByRange: ' +
        JSON.stringify(movement));
        console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 count: ' + count);
      });

      let t = setTimeout(() => {
        try {
          console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 setTimeout count: ' + count);
          expect(count).assertEqual(1);
          clearTimeout(t);
          done();
          console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 Succeed offSelectByRange ');
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_offSelectByRange_0130 offSelectByRange err: ' + JSON.stringify(err));
          done();
        }
      }, 1000);

      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
        code: 130
      }
      commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_offSelectByMovement_0140
    * @tc.name   Sub_Misc_inputMethod_offSelectByMovement_0140
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_offSelectByMovement_0140', 0, async (done: Function) => {

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_offSelectByMovement_0140 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_offSelectByMovement_0140 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let count = 0;
      inputMethodController.on("selectByMovement", async (movement) => {
        console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 offSelectByMovement start');
        inputMethodController.off("selectByMovement");
        count += 1;
        console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 Succeed offSelectByMovement: ' +
        JSON.stringify(movement));
        console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 count: ' + count);
      });

      let t = setTimeout(() => {
        try {
          console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 setTimeout count: ' + count);
          expect(count).assertEqual(1);
          clearTimeout(t);
          done();
          console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 Succeed offSelectByMovement ');
        } catch (err) {
          console.info('====>Sub_Misc_inputMethod_offSelectByMovement_0140 offSelectByMovement err: ' +
          JSON.stringify(err));
          done();
        }
      }, 1000);

      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
        code: 140
      }
      commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_onImeChange_0150
    * @tc.name   Sub_Misc_inputMethod_onImeChange_0150
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_onImeChange_0150', 0, async (done: Function) => {
      let inputMethodSetting = inputMethod.getSetting();
      let inputStageService: subtype = {
        id: 'inputStageService',
        label: '',
        name: 'com.acts.inputmethodengine.test',
        mode: 'lower',
        locale: '',
        language: '',
        icon: '',
        iconId: 0,
        extra: {},
      }
      let inputDemoService: subtype = {
        id: "InputDemoService",
        label: "",
        name: "com.acts.inputmethodengine.test",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      }
      inputMethodSetting.on("imeChange", async (inputMethodProperty, inputMethodSubtype) => {
        inputMethodSetting.off("imeChange");
        await inputMethod.switchCurrentInputMethodSubtype(inputStageService);
        console.info("====>Sub_Misc_inputMethod_onImeChange_0150  inputMethodProperty:" +
        JSON.stringify(inputMethodProperty));
        console.info("====>Sub_Misc_inputMethod_onImeChange_0150  inputMethodSubtype:" +
        JSON.stringify(inputMethodSubtype));
        expect(typeof (inputMethodProperty) !== null).assertTrue();
        expect(typeof (inputMethodSubtype) !== null).assertTrue();
        done();
      })
      try {
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        console.info("====>Sub_Misc_inputMethod_onImeChange_0150  switchInputMethod success" +
        JSON.stringify(inputServer));
      } catch (err) {
        console.info("====>Sub_Misc_inputMethod_onImeChange_0150 switchInputMethod fail" + JSON.stringify(err));
      }
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_offImeChange_0160
    * @tc.name   Sub_Misc_inputMethod_offImeChange_0160
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_offImeChange_0160', 0, async (done: Function) => {
      let count = 0;
      let inputMethodSetting = inputMethod.getSetting();
      let inputStageService: subtype = {
        id: 'inputStageService',
        label: '',
        name: 'com.acts.inputmethodengine.test',
        mode: 'lower',
        locale: '',
        language: '',
        icon: '',
        iconId: 0,
        extra: {},
      }
      let inputDemoService: subtype = {
        id: "InputDemoService",
        label: "",
        name: "com.acts.inputmethodengine.test",
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      }
      inputMethodSetting.on("imeChange", (inputMethodProperty, inputMethodSubtype) => {
        inputMethodSetting.off("imeChange");
        count += 1;
        console.info("====>Sub_Misc_inputMethod_offImeChange_0160 count:" + count);
      })

      try {
        await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
        console.info('====>Sub_Misc_inputMethod_offImeChange_0160 switchInputMethod');
        let t = setTimeout(async () => {
          clearTimeout(t);
          await inputMethod.switchCurrentInputMethodSubtype(inputStageService);
        }, 300);
      } catch (err) {
        console.info("====>Sub_Misc_inputMethod_offImeChange_0160 switchInputMethod fail" + JSON.stringify(err));
      }

      let t = setTimeout(() => {
        clearTimeout(t);
        try {
          console.info('====>Sub_Misc_inputMethod_offImeChange_0160 setTimeout count: ' + count);
          expect(count === 1).assertTrue();
        } catch (err) {
          console.info("====>Sub_Misc_inputMethod_offImeChange_0160 switchInputMethod fail" + JSON.stringify(err));
        }
        done();
      }, 1000);
    });

    /*
    * @tc.number  inputMethodAbility_test_091
    * @tc.name   inputMethodAbility_test_091
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('inputMethodAbility_test_091', 0, async (done: Function) => {
      let flag = true;

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_091 unSubscriberCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_091 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>inputMethodAbility_test_091 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>inputMethodAbility_test_091 subscriberCallback data:" + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        flag = false;
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>inputMethodAbility_test_091 publishCallback start");
        if (err) {
          console.info("====>inputMethodAbility_test_091 publishCallback failed:" + JSON.stringify(err));
        } else {
          let t = setTimeout(async () => {
            await inputMethod.switchInputMethod(inputServer);
            console.info("====>inputMethodAbility_test_091 setTimeout first: " + JSON.stringify(inputServer));
            let t1 = setTimeout(async () => {
              console.info("====>inputMethodAbility_test_091 setTimeout second: " + flag);
              expect(flag).assertTrue();
              clearTimeout(t1);
              await inputMethod.switchCurrentInputMethodSubtype(inputDemoService);
              console.info("====>inputMethodAbility_test_091 switchInputMethod second" +
              JSON.stringify(inputDemoService));
              let t2 = setTimeout(() => {
                clearTimeout(t2)
                done();
              }, 500)
            }, 1000)
            clearTimeout(t);
          }, 1000)
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["inputMethodAbility_test_091"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>inputMethodAbility_test_091 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>inputMethodAbility_test_091 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 91
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_sendExtendAction_0170
    * @tc.name   Sub_Misc_inputMethod_sendExtendAction_0170
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_sendExtendAction_0170', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_sendExtendAction_0170"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0170 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 170
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_sendExtendAction_0180
    * @tc.name   Sub_Misc_inputMethod_sendExtendAction_0180
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_sendExtendAction_0180', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_sendExtendAction_0180"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_sendExtendAction_0180 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 180
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getForward_sync_0200
    * @tc.name   Sub_Misc_inputMethod_getForward_sync_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getForward_sync_0200', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getForward_sync_0200"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 200
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getForward_sync_0201
    * @tc.name   Sub_Misc_inputMethod_getForward_sync_0201
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getForward_sync_0201', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getForward_sync_0201"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getForward_sync_0201 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 201
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getBackward_sync_0210
    * @tc.name   Sub_Misc_inputMethod_getBackward_sync_0210
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getBackward_sync_0210', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getBackward_sync_0210"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0210 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 210
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getBackward_sync_0211
    * @tc.name   Sub_Misc_inputMethod_getBackward_sync_0211
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getBackward_sync_0211', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getBackward_sync_0211"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getBackward_sync_0211 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 211
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220
    * @tc.name   Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 220
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221
    * @tc.name   Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 221
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getEditorAttribute_sync_0230
    * @tc.name   Sub_Misc_inputMethod_getEditorAttribute_sync_0230
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getEditorAttribute_sync_0230', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getEditorAttribute_sync_0230"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 230
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getEditorAttribute_sync_0231
    * @tc.name   Sub_Misc_inputMethod_getEditorAttribute_sync_0231
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getEditorAttribute_sync_0231', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getEditorAttribute_sync_0231"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 231
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_getEditorAttribute_sync_0233
    * @tc.name   Sub_Misc_inputMethod_getEditorAttribute_sync_0233
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_getEditorAttribute_sync_0233', 0, async (done: Function) => {
      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 publishCallback failed:" +
          JSON.stringify(err));
        }
      }
      await runCmd();
      console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 runCmd success");
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_getEditorAttribute_sync_0233"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 subscriber data:" +
          JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_getEditorAttribute_sync_0233 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 233
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_moveCursor_sync_0240
    * @tc.name   Sub_Misc_inputMethod_moveCursor_sync_0240
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_moveCursor_sync_0240', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_moveCursor_sync_0240"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0240 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 240
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_moveCursor_sync_0241
    * @tc.name   Sub_Misc_inputMethod_moveCursor_sync_0241
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_moveCursor_sync_0241', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_moveCursor_sync_0241"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_moveCursor_sync_0241 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 241
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_deleteForward_sync_0250
    * @tc.name   Sub_Misc_inputMethod_deleteForward_sync_0250
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_deleteForward_sync_0250', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_deleteForward_sync_0250"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0250 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 250
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_deleteForward_sync_0251
    * @tc.name   Sub_Misc_inputMethod_deleteForward_sync_0251
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_deleteForward_sync_0251', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_deleteForward_sync_0251"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_deleteForward_sync_0251 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 251
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_deleteBackward_sync_0260
    * @tc.name   Sub_Misc_inputMethod_deleteBackward_sync_0260
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_deleteBackward_sync_0260', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_deleteBackward_sync_0260"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0260 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 260
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_deleteBackward_sync_0261
    * @tc.name   Sub_Misc_inputMethod_deleteBackward_sync_0261
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_deleteBackward_sync_0261', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_deleteBackward_sync_0261"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_deleteBackward_sync_0261 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 261
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_insertText_sync_0270
    * @tc.name   Sub_Misc_inputMethod_insertText_sync_0270
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_insertText_sync_0270', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_insertText_sync_0270"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0270 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 270
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)


      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_insertText_sync_0271
    * @tc.name   Sub_Misc_inputMethod_insertText_sync_0271
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_insertText_sync_0271', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_insertText_sync_0271"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_insertText_sync_0271 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 271
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_selectByRange_sync_0280
    * @tc.name   Sub_Misc_inputMethod_selectByRange_sync_0280
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_selectByRange_sync_0280', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_selectByRange_sync_0280"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0280 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 280
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_selectByRange_sync_0281
    * @tc.name   Sub_Misc_inputMethod_selectByRange_sync_0281
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_selectByRange_sync_0281', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_selectByRange_sync_0281"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_selectByRange_sync_0281 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 281
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_selectByMovement_sync_0290
    * @tc.name   Sub_Misc_inputMethod_selectByMovement_sync_0290
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_selectByMovement_sync_0290', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_selectByMovement_sync_0290"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0290 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 290
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_inputMethod_selectByMovement_sync_0291
    * @tc.name   Sub_Misc_inputMethod_selectByMovement_sync_0291
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_inputMethod_selectByMovement_sync_0291', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_inputMethod_selectByMovement_sync_0291"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_inputMethod_selectByMovement_sync_0291 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 291
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  Sub_Misc_Request_InputMethod_selectContext_0400
    * @tc.name   Sub_Misc_Request_InputMethod_selectContext_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_Request_InputMethod_selectContext_0400', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_Request_InputMethod_selectContext_0400"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0400 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 300
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })


    });

    /*
    * @tc.number  Sub_Misc_Request_InputMethod_selectContext_0500
    * @tc.name   Sub_Misc_Request_InputMethod_selectContext_0500
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_Request_InputMethod_selectContext_0500', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_Request_InputMethod_selectContext_0500"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0500 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 310
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })


    });

    /*
    * @tc.number  Sub_Misc_Request_InputMethod_selectContext_0600
    * @tc.name   Sub_Misc_Request_InputMethod_selectContext_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('Sub_Misc_Request_InputMethod_selectContext_0600', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 unSubscriberCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 publishCallback start");
        if (err) {
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["Sub_Misc_Request_InputMethod_selectContext_0600"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 subscriber data:" + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>Sub_Misc_Request_InputMethod_selectContext_0600 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 320
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })


    });

    /*
    * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0100
    * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IsTextPreviewSupport_0100', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0100"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 340
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 340
        }
        commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0200
    * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IsTextPreviewSupport_0200', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0200"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0200 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 350
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0300
    * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IsTextPreviewSupport_0300', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0300"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0300 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 360
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IsTextPreviewSupport_0400
    * @tc.name    SUB_InputMethod_IsTextPreviewSupport_0400
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IsTextPreviewSupport_0400', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 publishCallback failed:" + JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IsTextPreviewSupport_0400"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IsTextPreviewSupport_0400 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 370
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IME_PrivateDateTransferred_0500
    * @tc.name    SUB_InputMethod_IME_PrivateDateTransferred_0500
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IME_PrivateDateTransferred_0500', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IME_PrivateDateTransferred_0500"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0500 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 380
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IME_PrivateDateTransferred_0600
    * @tc.name    SUB_InputMethod_IME_PrivateDateTransferred_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IME_PrivateDateTransferred_0600', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IME_PrivateDateTransferred_0600"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_0600 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 390
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_InputMethod_IME_PrivateDateTransferred_1100
    * @tc.name    SUB_InputMethod_IME_PrivateDateTransferred_1100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_InputMethod_IME_PrivateDateTransferred_1100', 0, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 subscriberCallback data:"
          + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = (err: BusinessError) => {
        console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 publishCallback start");
        if (err) {
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 publishCallback failed:" +
          JSON.stringify(err));
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["SUB_InputMethod_IME_PrivateDateTransferred_1100"]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((data) => {
        try {
          subscriber = data;
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 subscriber data:" + JSON.stringify(data))
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_InputMethod_IME_PrivateDateTransferred_1100 subscriber finish");
        } catch (err) {
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            code: 400
          }
          commonEventManager.publish('inputMethodAbilityTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

  });
};
