/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function sideBarShowSideBarJsunit() {
  describe('sideBarShowSideBarTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sideBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sideBar state success " + JSON.stringify(pages));
        if (!("sideBar" == pages.name)) {
          console.info("get sideBar state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push sideBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sideBar page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sideBarShowSideBar after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testsideBarShowSideBar0001
     * @tc.desic        acesideBarShowSideBarEtsTest0001
     */
    it('testsideBarShowSideBar0001', 0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0001] component showSideBar strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.showSideBar).assertEqual("true");
      console.info("[testsideBarShowSideBar0001] showSideBar value :" + JSON.parse(strJson).$attrs.showSideBar);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testsideBarShowSideBar0002
     * @tc.desic        acesideBarShowSideBarEtsTest0002
     */
    it('testsideBarShowSideBar0002', 0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0002] component autoHide strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.autoHide).assertEqual('false');
      console.info("[testsideBarShowSideBar0002] autoHide value :" + JSON.parse(strJson).$attrs.autoHide);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testsideBarShowSideBar0003
     * @tc.desic        acesideBarShowSideBarEtsTest0003
     */
    it('testsideBarShowSideBar0003', 0, async () => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0003] component autoHide strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('SideBarContainer');
      expect(JSON.parse(strJson).$attrs.sideBarPosition).assertEqual('SideBarPosition.End');
      console.info("[testsideBarShowSideBar0003] autoHide value :" + JSON.parse(strJson).$attrs.autoHide);

    });
  })
}
