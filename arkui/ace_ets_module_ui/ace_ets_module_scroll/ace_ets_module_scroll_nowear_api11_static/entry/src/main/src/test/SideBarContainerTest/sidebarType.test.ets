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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { UtilsTest, startAbility } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function sidebarTypeTest() {
  describe('sidebarTypeTest', () => {
    beforeAll(() => {
      console.info("sidebarTypeTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sidebarType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sidebarType state success " + JSON.stringify(pages));
        if (!("sidebarType" == pages.name)) {
          console.info("get sidebarType state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push sidebarType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sidebarType page error: " + err);
      }
    });

    
/**
     * @tc.number   ArkUX_SideBarContainer_static_1000
     * @tc.name     ArkUX_SideBarContainer_static_1000
     * @tc.desc     ArkUX_SideBarContainer_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_SideBarContainer_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ArkUX_SideBarContainer_static_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_SideBarContainer_1000');
          console.info('ArkUX_SideBarContainer_static_1000 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_static_1000 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("300.000000");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth')).assertEqual("100.000000");
          console.info('ArkUX_SideBarContainer_static_1000 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_SideBarContainer_static_1100
     * @tc.name     ArkUX_SideBarContainer_static_1100
     * @tc.desc     ArkUX_SideBarContainer_static_1100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_SideBarContainer_static_1100', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ArkUX_SideBarContainer_static_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_SideBarContainer_1100');
          console.info('ArkUX_SideBarContainer_static_1100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_static_1100 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("30000.000000");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth')).assertEqual("10000.000000");
          console.info('ArkUX_SideBarContainer_static_1100 END ');

        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_SideBarContainer_static_1200
     * @tc.name     ArkUX_SideBarContainer_static_1200
     * @tc.desc     ArkUX_SideBarContainer_static_1200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_SideBarContainer_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ArkUX_SideBarContainer_static_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_SideBarContainer_1200');
          console.info('ArkUX_SideBarContainer_static_1200 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_static_1200 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual("SideBarContainerType.Embed");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("10.000000");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth')).assertEqual("10.000000");
          console.info('ArkUX_SideBarContainer_static_1200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_SideBarContainer_static_1300
     * @tc.name     ArkUX_SideBarContainer_static_1300
     * @tc.desc     ArkUX_SideBarContainer_static_1300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_SideBarContainer_static_1300', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ArkUX_SideBarContainer_static_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_SideBarContainer_1300');
          console.info('ArkUX_SideBarContainer_static_1300 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_static_1300 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual("SideBarContainerType.OVERLAY");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("200.000000");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth')).assertEqual("400.000000");
          console.info('ArkUX_SideBarContainer_static_1300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_SideBarContainer_static_1400
     * @tc.name     ArkUX_SideBarContainer_static_1400
     * @tc.desc     ArkUX_SideBarContainer_static_1400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_SideBarContainer_static_1400', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('ArkUX_SideBarContainer_static_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_SideBarContainer_1400');
          console.info('ArkUX_SideBarContainer_static_1400 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_SideBarContainer_static_1400 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual("SideBarContainerType.Embed");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minContentWidth')).assertEqual("360.000000");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('minSideBarWidth')).assertEqual("240.000000");
          console.info('ArkUX_SideBarContainer_static_1400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_SideBarContainer_static_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}