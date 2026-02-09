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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Point
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function TextOnChangeOptionsTest() {
  describe('TextOnChangeOptionsTest', () => {
    beforeAll(() => {
      console.info("TextOnChangeOptionsTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextOnChangeOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextChangeTest/TextOnChangeOptionsTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextOnChangeOptionsTest state success " + JSON.stringify(pages));
        // let result = routerInstance.replaceUrl(options);
        routerInstance.replaceUrl(options);
        if (!("TextOnChangeOptionsTest" == pages.name)) {
          console.info("get TextOnChangeOptionsTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          // console.info("push TextOnChangeOptionsTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextOnChangeOptionsTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("TextOnChangeOptionsTest after each called");
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0001
     * @tc.name     TextOnChangeOptionsTest_static_0001
     * @tc.desc     TextOnChangeOptionsTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0001 START');
      await CommonFunc.sleep(1000);

      let search = await driver.findComponent(ON.id('search'));
      await CommonFunc.sleep(500);
      let point = await search!.getBoundsCenter();
      await CommonFunc.sleep(500);
      await (driver.inputText(point, '3') as Promise<void>)
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0001---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('123');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('2-2');
      expect(rangeAfterText).assertEqual('2-3');
      console.info("[TextOnChangeOptionsTest0001] end");
      done();
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0002
     * @tc.name     TextOnChangeOptionsTest_static_0002
     * @tc.desc     TextOnChangeOptionsTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0002 START');

      await CommonFunc.sleep(1000);
      let search = await driver.findComponent(ON.id('search'));
      await CommonFunc.sleep(500);
      await (search?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0002---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('1');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('1-2');
      expect(rangeAfterText).assertEqual('1-1');
      console.info("[TextOnChangeOptionsTest0002] end");
      done();
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0003
     * @tc.name     TextOnChangeOptionsTest_static_0003
     * @tc.desc     TextOnChangeOptionsTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0003 START');
      await CommonFunc.sleep(1000);

      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      let point = await textArea!.getBoundsCenter();
      await CommonFunc.sleep(500);
      await (driver.inputText(point, '3') as Promise<void>)
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0003---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('123');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('2-2');
      expect(rangeAfterText).assertEqual('2-3');
      console.info("[TextOnChangeOptionsTest0003] end");
      done();
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0004
     * @tc.name     TextOnChangeOptionsTest_static_0004
     * @tc.desc     TextOnChangeOptionsTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0004 START');

      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('textArea'));
      await CommonFunc.sleep(500);
      await (textArea?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0004---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('1');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('1-2');
      expect(rangeAfterText).assertEqual('1-1');
      console.info("[TextOnChangeOptionsTest0004] end");
      done();
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0005
     * @tc.name     TextOnChangeOptionsTest_static_0005
     * @tc.desc     TextOnChangeOptionsTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0005 START');
      await CommonFunc.sleep(1000);

      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      let point = await textInput!.getBoundsCenter();
      await CommonFunc.sleep(500);
      await (driver.inputText(point, '3') as Promise<void>)
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0005---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('123');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('2-2');
      expect(rangeAfterText).assertEqual('2-3');
      console.info("[TextOnChangeOptionsTest0005] end");
      done();
    });


    
    /**
     * @tc.number   TextOnChangeOptionsTest_static_0006
     * @tc.name     TextOnChangeOptionsTest_static_0006
     * @tc.desc     TextOnChangeOptionsTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('TextOnChangeOptionsTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('TextOnChangeOptionsTest TextOnChangeOptionsTest0006 START');

      await CommonFunc.sleep(1000);
      let textInput = await driver.findComponent(ON.id('textInput'));
      await CommonFunc.sleep(500);
      await (textInput?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);

      let oldContent = inspector.getInspectorByKey('oldContent');
      let oldContentText: string = JSON.parseJsonElement(oldContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + oldContentText)

      let newContent = inspector.getInspectorByKey('newContent');
      let newContentText: string = JSON.parseJsonElement(newContent).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + newContentText)

      let oldPreviewTextValue = inspector.getInspectorByKey('oldPreviewTextValue');
      let oldPreviewTextValueText: string =
        JSON.parseJsonElement(oldPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + oldPreviewTextValueText)

      let oldPreviewTextOffset = inspector.getInspectorByKey('oldPreviewTextOffset');
      let oldPreviewTextOffsetText: string =
        JSON.parseJsonElement(oldPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + oldPreviewTextOffsetText)

      let newPreviewTextValue = inspector.getInspectorByKey('newPreviewTextValue');
      let newPreviewTextValueText: string =
        JSON.parseJsonElement(newPreviewTextValue).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + newPreviewTextValueText)

      let newPreviewTextOffset = inspector.getInspectorByKey('newPreviewTextOffset');
      let newPreviewTextOffsetText: string =
        JSON.parseJsonElement(newPreviewTextOffset).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + newPreviewTextOffsetText)

      let rangeBefore = inspector.getInspectorByKey('rangeBefore');
      let rangeBeforeText: string = JSON.parseJsonElement(rangeBefore).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + rangeBeforeText)

      let rangeAfter = inspector.getInspectorByKey('rangeAfter');
      let rangeAfterText: string = JSON.parseJsonElement(rangeAfter).getElement('$attrs').getString('content');
      console.log('TextOnChangeOptionsTest0006---' + rangeAfterText)

      expect(oldContentText).assertEqual('12');
      expect(newContentText).assertEqual('1');
      expect(oldPreviewTextValueText).assertEqual('');
      expect(oldPreviewTextOffsetText).assertEqual('-1');
      expect(newPreviewTextValueText).assertEqual('');
      expect(newPreviewTextOffsetText).assertEqual('-1');
      expect(rangeBeforeText).assertEqual('1-2');
      expect(rangeAfterText).assertEqual('1-1');
      console.info("[TextOnChangeOptionsTest0006] end");
      done();
    });
  })
}