'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function textpickermultiTest() {
  describe('ActsTextPickerTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPicker/TextPickerMulti",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerMulti state pages:" + JSON.stringify(pages));
        if (!("TextPickerMulti" == pages.name)) {
          console.info("get TextPickerMulti pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerMulti page error " + JSON.stringify(err));
      }
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0100
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0100
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_1');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0100]:" + JSON.stringify(obj.getElement('$attrs').getString('range')));
          expect(obj.getElement('$attrs').getString('range')).assertEqual('[["apple1","apple2","apple3","apple4"],' +
            '["orange1","orange2","orange3","orange4"],["peach1","peach2","peach3","peach4"]]');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0200
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0200
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0200 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_2');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0200]:" + JSON.stringify(obj.getElement('$attrs').getString('range')));
          expect(obj.getElement('$attrs').getString('range')).assertEqual('[{"text":"辽宁省",' +
            ' "children":[{"text":"沈阳市", "children":[{"text":"沈河区"},{"text":"和平区"},{"text":"浑南区"}]},' +
            '{"text":"大连市", "children":[{"text":"中山区"},{"text":"金州区"},{"text":"长海县"}]}]},' +
            '{"text":"吉林省", "children":[{"text":"长春市", "children":[{"text":"南关区"},{"text":"宽城区"},' +
            '{"text":"朝阳区"}]},{"text":"四平市", "children":[{"text":"铁西区"},{"text":"铁东区"},{"text":"梨树县"}]}]},' +
            '{"text":"黑龙江省", "children":[{"text":"哈尔滨市", "children":[{"text":"道里区"},{"text":"道外区"},' +
            '{"text":"南岗区"}]},{"text":"牡丹江市", "children":[{"text":"东安区"},{"text":"西安区"},{"text":"爱民区"}]}]}]');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0300
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0300
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0300 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_3');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0300]:" + JSON.stringify(obj.getElement('$attrs').getArray('selecteds')));
          expect(obj.getElement('$attrs').getArray('selecteds')[0].asString()).assertEqual('1');
          expect(obj.getElement('$attrs').getArray('selecteds')[1].asString()).assertEqual('1');
          expect(obj.getElement('$attrs').getArray('selecteds')[2].asString()).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0400
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0400
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0400 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_4');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0400]:" + JSON.stringify(obj.getElement('$attrs').getArray('values')));
          expect(obj.getElement('$attrs').getArray('values')[0].asString()).assertEqual('辽宁省');
          expect(obj.getElement('$attrs').getArray('values')[1].asString()).assertEqual('大连市');
          expect(obj.getElement('$attrs').getArray('values')[2].asString()).assertEqual('中山区');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0500
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0500
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0500 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_5');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0500]:" + JSON.stringify(obj.getElement('$attrs').getArray('selectedIndex')));
          expect(obj.getElement('$attrs').getArray('selectedIndex')[0].asString()).assertEqual('2');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[1].asString()).assertEqual('1');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[2].asString()).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0600
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0600
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0600 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_6');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0600]:" + JSON.stringify(obj.getElement('$attrs').getArray('selectedIndex')));
          expect(obj.getElement('$attrs').getArray('selectedIndex')[0].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[1].asString()).assertEqual('1');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[2].asString()).assertEqual('2');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0700
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0700
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0700 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_7');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0700]:" + JSON.stringify(obj.getElement('$attrs').getArray('selectedIndex')));
          expect(obj.getElement('$attrs').getArray('selectedIndex')[0].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[1].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[2].asString()).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0800
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0800
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0800 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_8');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0800]:" + JSON.stringify(obj.getElement('$attrs').getArray('selectedIndex')));
          expect(obj.getElement('$attrs').getArray('selectedIndex')[0].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[1].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[2].asString()).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_0900
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_0900
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_0900 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_9');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_0900]:" + JSON.stringify(obj.getElement('$attrs').getArray('selectedIndex')));
          expect(obj.getElement('$attrs').getArray('selectedIndex')[0].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[1].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selectedIndex')[2].asString()).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_1000
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_1000
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_1000 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_10');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_1000]:" + JSON.stringify(obj.getElement('$attrs').getArray('selecteds')));
          expect(obj.getElement('$attrs').getArray('selecteds')[0].asString()).assertEqual('1');
          expect(obj.getElement('$attrs').getArray('selecteds')[1].asString()).assertEqual('0');
          expect(obj.getElement('$attrs').getArray('selecteds')[2].asString()).assertEqual('0');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });



    
    
    /**
     * @tc.number   ArkUXII_Stage_TextPicker_Options_static_1100
     * @tc.name     ArkUXII_Stage_TextPicker_Options_static_1100
     * @tc.desc     ArkUXII_Stage_TextPicker_Options_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUXII_Stage_TextPicker_Options_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUXII_Stage_TextPicker_Options_static_1100 start");
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textpicker_11');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[ArkUXII_Stage_TextPicker_Options_static_1100]:" + JSON.stringify(obj.getElement('$attrs').getArray('values')));
          expect(obj.getElement('$attrs').getArray('values')[0].asString()).assertEqual('辽宁省');
          expect(obj.getElement('$attrs').getArray('values')[1].asString()).assertEqual('大连市');
          expect(obj.getElement('$attrs').getArray('values')[2].asString()).assertEqual('中山区');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_TextPicker_Options_static_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
