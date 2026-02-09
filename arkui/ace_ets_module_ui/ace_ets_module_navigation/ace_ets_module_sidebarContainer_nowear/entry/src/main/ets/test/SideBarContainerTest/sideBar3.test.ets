/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';

export default function sideBarShowSideBarJsunit() {
  describe('sideBarShowSideBarTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/SideBarContainer/sideBar3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sideBar3 state success " + JSON.stringify(pages));
        if (!("sideBar3" == pages.name)) {
          console.info("get sideBar3 state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push sideBar3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sideBar3 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("sideBarShowSideBar after each called");
    });

    /**
     * @tc.name   testsideBarShowSideBar0001
     * @tc.number testsideBarShowSideBar0001
     * @tc.desc   acesideBarShowSideBarEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsideBarShowSideBar0001',  Level.LEVEL0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0001] component showSideBar strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.showSideBar).assertEqual("true");
      console.info("[testsideBarShowSideBar0001] showSideBar value :" + JSON.parse(strJson).$attrs.showSideBar);

    });

    /**
     * @tc.name   testsideBarShowSideBar0002
     * @tc.number testsideBarShowSideBar0002
     * @tc.desc   acesideBarShowSideBarEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsideBarShowSideBar0002',  Level.LEVEL0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0002] component autoHide strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.autoHide).assertEqual('false');
      console.info("[testsideBarShowSideBar0002] autoHide value :" + JSON.parse(strJson).$attrs.autoHide);

    });

    /**
     * @tc.name   testsideBarShowSideBar0003
     * @tc.number testsideBarShowSideBar0003
     * @tc.desc   acesideBarShowSideBarEtsTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsideBarShowSideBar0003',  Level.LEVEL0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0003] component autoHide strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.sideBarPosition).assertEqual('SideBarPosition.End');
      console.info("[testsideBarShowSideBar0003] autoHide value :" + JSON.parse(strJson).$attrs.autoHide);

    });
  })
}
