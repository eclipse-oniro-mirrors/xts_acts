'use static';
/**
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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function textPickerJsunit() {
  describe('appInfoTest_four_13', () => {
    beforeAll(() => {
      console.info("textPickerJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api11.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("button beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/textPickerDialog2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textPickerDialog state pages: " + JSON.stringify(pages));
        if (!("textPickerDialog2" == pages.name)) {
          console.info("get textPickerDialog state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textPickerDialog page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textPickerDialog after each called");
    })

    

    /**
     * @tc.number   testTextPickerDialog_static_0100
     * @tc.name     testTextPickerDialog_static_0100
     * @tc.desc     testTextPickerDialog_static_0100
     * @tc.level    Level.LEVEL2
     */
it('testTextPickerDialog_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[testTextPickerDialog0100] START');
        await Utils.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('textPickerDialog');
        console.info("[testTextPickerDialog0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
        console.info("[testTextPickerDialog0100] expect(obj.getString('$type')) is: " + (JSON.parseJsonElement(strJson).getString('$type')));
        console.info("[testTextPickerDialog0100] obj.getElement('$attrs').getString('type') is: " + (JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
        done();
      } catch(err) {
        expect().assertFail();
      }
    });

    

    /**
     * @tc.number   testTextPickerDialog_static_0200
     * @tc.name     testTextPickerDialog_static_0200
     * @tc.desc     testTextPickerDialog_static_0200
     * @tc.level    Level.LEVEL2
     */
it('testTextPickerDialog_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info('[testTextPickerDialog0200] START');
        await Utils.sleep(1000);
        let strJson: string = inspector.getInspectorByKey('textPickerDialog');
        if (true) {
          done();
          // return;
        }
        /*
        const textPickerDialogOption = new textPickerDialogOption();
        textPickerDialogOption.defaultPickerItemHeight = 20;
        const textPickerAttribute = new TextPickerAttribute();
        textPickerAttribute.defaultPickerItemHeight = 20;
        const textPickerOption = new TextPickerOption();
        textPickerOption.value = "textPickerOptionTest";
        */
        done();
      } catch(err) {
        expect().assertFail();
      }
    });
  })
}
