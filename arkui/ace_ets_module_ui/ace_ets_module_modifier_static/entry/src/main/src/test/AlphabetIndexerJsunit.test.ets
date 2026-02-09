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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerTest', () => {
    beforeAll(() => {
      console.info("alphabetIndexerTest beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");
    });

    beforeEach(async () => {
      console.info("alphabetIndexerJsunit beforeEach start");
      const alphabetIndexer = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alphabetIndexer',
      }

      try {
        alphabetIndexer.clear();
        let pages = alphabetIndexer.getState();
        console.info("get alphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name: " + JSON.stringify(pages.name));
           alphabetIndexer.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push alphabetIndexer page error: " + err);
      }
    })

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0101
     * @tc.name     ArkUI_AlphabetIndexer_static_0101
     * @tc.desc     ArkUI_AlphabetIndexer_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0101 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('font').getString('fontSize')).assertEqual("18.00fp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0102
     * @tc.name     ArkUI_AlphabetIndexer_static_0102
     * @tc.desc     ArkUI_AlphabetIndexer_static_0102
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0102 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedFont').getString('fontSize')).assertEqual("28.00fp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0103
     * @tc.name     ArkUI_AlphabetIndexer_static_0103
     * @tc.desc     ArkUI_AlphabetIndexer_static_0103
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0103 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual("#FF000000");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0104
     * @tc.name     ArkUI_AlphabetIndexer_static_0104
     * @tc.desc     ArkUI_AlphabetIndexer_static_0104
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0104', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0104 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual("#FFFF1493");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0105
     * @tc.name     ArkUI_AlphabetIndexer_static_0105
     * @tc.desc     ArkUI_AlphabetIndexer_static_0105
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0105', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0105 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#FFBEBEBE");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0106
     * @tc.name     ArkUI_AlphabetIndexer_static_0106
     * @tc.desc     ArkUI_AlphabetIndexer_static_0106
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0106', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0106 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSize')).assertEqual("26.00vp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0107
     * @tc.name     ArkUI_AlphabetIndexer_static_0107
     * @tc.desc     ArkUI_AlphabetIndexer_static_0107
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0107', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0107 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('usingPopup')).assertEqual("true");
      done();
    }); 
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0108
     * @tc.name     ArkUI_AlphabetIndexer_static_0108
     * @tc.desc     ArkUI_AlphabetIndexer_static_0108
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0108', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0108 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignStyle')).assertEqual("IndexerAlign.Left");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0109
     * @tc.name     ArkUI_AlphabetIndexer_static_0109
     * @tc.desc     ArkUI_AlphabetIndexer_static_0109
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0109', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0109 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupFont').getString('fontSize')).assertEqual("28.00fp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0110
     * @tc.name     ArkUI_AlphabetIndexer_static_0110
     * @tc.desc     ArkUI_AlphabetIndexer_static_0110
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0110 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupColor')).assertEqual("#FFFFA500");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0111
     * @tc.name     ArkUI_AlphabetIndexer_static_0111
     * @tc.desc     ArkUI_AlphabetIndexer_static_0111
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0111', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0111 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupBackground')).assertEqual("#FF32CD32");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0112
     * @tc.name     ArkUI_AlphabetIndexer_static_0112
     * @tc.desc     ArkUI_AlphabetIndexer_static_0112
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0112', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0112 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual("1");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0113
     * @tc.name     ArkUI_AlphabetIndexer_static_0113
     * @tc.desc     ArkUI_AlphabetIndexer_static_0113
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0113', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0113 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupPosition').getString('popupPositionX')).assertEqual("90.00vp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0114
     * @tc.name     ArkUI_AlphabetIndexer_static_0114
     * @tc.desc     ArkUI_AlphabetIndexer_static_0114
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0114', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0114 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupSelectedColor')).assertEqual("#FF00CED1");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0115
     * @tc.name     ArkUI_AlphabetIndexer_static_0115
     * @tc.desc     ArkUI_AlphabetIndexer_static_0115
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0115', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0115 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupUnselectedColor')).assertEqual("#FFC0FF3E");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0116
     * @tc.name     ArkUI_AlphabetIndexer_static_0116
     * @tc.desc     ArkUI_AlphabetIndexer_static_0116
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0116', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0116 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupItemBackground')).assertEqual("#FF8470FF");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0117
     * @tc.name     ArkUI_AlphabetIndexer_static_0117
     * @tc.desc     ArkUI_AlphabetIndexer_static_0117
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0117', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0117 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest2');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('popupItemFontSize')).assertEqual("30.00fp");
      done();
    });

    
    
    /**
     * @tc.number   ArkUI_AlphabetIndexer_static_0118
     * @tc.name     ArkUI_AlphabetIndexer_static_0118
     * @tc.desc     ArkUI_AlphabetIndexer_static_0118
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0118', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ArkUI_AlphabetIndexer_static_0118 START');
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('alphabetIndexerTest2');
      console.info("ArkUI_AlphabetIndexer_static_0118 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('selected')).assertEqual("2");
      console.info('ArkUI_AlphabetIndexer_static_0118 END');
      done();
    });

  })
}