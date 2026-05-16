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


import { afterEach, beforeEach, describe, expect, it, beforeAll, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('');
    }, (time.toInt()) * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function scrollbarJsunit() {
  describe('scrollbarTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info('[scrollbarTest] before each called')
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/ScrollBar',
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("[scrollbarTest] current page is: " + JSON.stringify(pages.name));
        if (!('ScrollBar' == pages.name)) {
          routerAlp.pushUrl(options);
          
        }
      } catch (err) {
        console.info("push scrollBar page error " + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   testScrollbar010_static_01
     * @tc.name     testScrollbar010_static_01
     * @tc.desc     testScrollbar010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar010_static_01 START');
      let strJson = inspector.getInspectorByKey('scrollbar1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar1] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto');
      console.info('testScrollbar010_static_01 End');
      done();
    });


    
    /**
     * @tc.number   testScrollbar020_static_02
     * @tc.name     testScrollbar020_static_02
     * @tc.desc     testScrollbar020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar020_static_02 START');
      let strJson = inspector.getInspectorByKey('scrollbar2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar');
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical');
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.On');
      console.info('testScrollbar020_static_02 End');
      done();
    });


    
    /**
     * @tc.number   testScrollbar030_static_03
     * @tc.name     testScrollbar030_static_03
     * @tc.desc     testScrollbar030_static_03
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar030_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar030_static_03 START');
      let strJson = inspector.getInspectorByKey('scrollbar3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Vertical')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off')
      console.info('testScrollbar030_static_03 End');
      done();
    });


    
    /**
     * @tc.number   testScrollbar040_static_04
     * @tc.name     testScrollbar040_static_04
     * @tc.desc     testScrollbar040_static_04
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar040_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar040_static_04 START');
      let strJson = inspector.getInspectorByKey('scrollbar4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Auto')
      console.info('testScrollbar040_static_04 End');
      done();
    });


    
    /**
     * @tc.number   testScrollbar050_static_05
     * @tc.name     testScrollbar050_static_05
     * @tc.desc     testScrollbar050_static_05
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar050_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar050_static_05 START');
      let strJson = inspector.getInspectorByKey('scrollbar5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar5] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.On')
      console.info('testScrollbar050_static_05 End');
      done();
    });


    
    /**
     * @tc.number   testScrollbar060_static_06
     * @tc.name     testScrollbar060_static_06
     * @tc.desc     testScrollbar060_static_06
     * @tc.level    Level.LEVEL0
     */
it('testScrollbar060_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScrollbar060_static_06 START');
      let strJson = inspector.getInspectorByKey('scrollbar6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[scrollbar6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ScrollBar')
      expect(obj.getElement('$attrs').getString('direction')).assertEqual('ScrollBarDirection.Horizontal')
      expect(obj.getElement('$attrs').getString('state')).assertEqual('BarState.Off')
      console.info('testScrollbar060_static_06 End');
      done();
    });
  })
}
