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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function sideBarShowSideBarJsunit() {
  describe('sideBarShowSideBarTest', () => {
    beforeAll(async () => {
      console.info("sideBarShowSideBarTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);

      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sideBar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sideBar state success " + JSON.stringify(pages));
        if (!("sideBar" == pages.name)) {
          console.info("get sideBar state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sideBar page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("sideBarShowSideBar after each called");
    });

    
    
/**
     * @tc.number   testsideBarShowSideBar0001_static_01
     * @tc.name     testsideBarShowSideBar0001_static_01
     * @tc.desc     testsideBarShowSideBar0001_static_01
     * @tc.level    Level.LEVEL1
     */
it('testsideBarShowSideBar0001_static_01', Level.LEVEL1, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0001_static_01 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0001_static_01] component showSideBar strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar')).assertEqual("true");
      console.info("[testsideBarShowSideBar0001_static_01] showSideBar value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'));

    });

    
    
/**
     * @tc.number   testsideBarShowSideBar0002_static_02
     * @tc.name     testsideBarShowSideBar0002_static_02
     * @tc.desc     testsideBarShowSideBar0002_static_02
     * @tc.level    Level.LEVEL1
     */
it('testsideBarShowSideBar0002_static_02', Level.LEVEL1, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0002_static_02 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0002_static_02] component autoHide strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide')).assertEqual('false');
      console.info("[testsideBarShowSideBar0002_static_02] autoHide value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));

    });

    
    
/**
     * @tc.number   testsideBarShowSideBar0003_static_03
     * @tc.name     testsideBarShowSideBar0003_static_03
     * @tc.desc     testsideBarShowSideBar0003_static_03
     * @tc.level    Level.LEVEL1
     */
it('testsideBarShowSideBar0003_static_03', Level.LEVEL1, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0003_static_03 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0003_static_03] component autoHide strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition')).assertEqual('SideBarPosition.End');
      console.info("[testsideBarShowSideBar0003_static_03] autoHide value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));

    });
  })
}
