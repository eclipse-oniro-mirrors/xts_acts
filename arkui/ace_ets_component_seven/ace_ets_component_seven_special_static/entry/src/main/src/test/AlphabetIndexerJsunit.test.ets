'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerJsunit', () => {
    beforeAll(() => {
      console.info("alphabetIndexerJsunit beforeEach start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("alphabetIndexerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/alphabetIndexer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get alphabetIndexer state pages: " + JSON.stringify(pages));
        if (!("alphabetIndexer" == pages.name)) {
          console.info("get alphabetIndexer state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push alphabetIndexer page result: " + JSON.stringify(result));
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('font').getString('fontSize')).assertEqual("18.00fp");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('selectedFont').getString('fontSize')).assertEqual("28.00fp");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('color')).assertEqual("#FF000000");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FFFF1493");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('selectedBackgroundColor')).assertEqual("#FFBEBEBE");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('itemSize')).assertEqual("26.00vp");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('usingPopup')).assertEqual("true");
      done();
    });    /**
     
    
    
/**
     * @tc.number   ArkUI_AlphabetIndexer_static_0108
     * @tc.name     ArkUI_AlphabetIndexer_static_0108
     * @tc.desc     ArkUI_AlphabetIndexer_static_0108
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_AlphabetIndexer_static_0108', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_AlphabetIndexer_static_0108 start");
      let strJson = inspector.getInspectorByKey('alphabetIndexerTest1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('alignStyle')).assertEqual("IndexerAlign.Left");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('popupFont').getString('fontSize')).assertEqual("28.00fp");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupColor')).assertEqual("#FFFFA500");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupBackground')).assertEqual("#FF32CD32");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('selected')).assertEqual("1");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('popupPosition').getString('popupPositionX')).assertEqual("90.00vp");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupSelectedColor')).assertEqual("#FF00CED1");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupUnselectedColor')).assertEqual("#FFC0FF3E");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupItemBackground')).assertEqual("#FF8470FF");
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
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('popupItemFontSize')).assertEqual("30.00fp");
      done();
    });


  })
}