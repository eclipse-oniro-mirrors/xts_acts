/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function grid_GridFrictionTest() {
  describe('grid_GridFrictionTest', function () {
    beforeEach(async function (done) {
      console.info("GridFrictionPage beforeEach start");
      let options = {
        url: 'MainAbility/pages/Grid/Grid_attribute/GridFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridFrictionPage state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get GridFrictionPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridFrictionPage page error:" + err);
      }
      console.info("GridFrictionPage beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("GridFrictionPage after each called");
    });
    /**
     * @tc.number    SUB_ACE_GRID_GRIDFRICTION_001
     * @tc.name      testGridFriction
     * @tc.desc      set friction to -1
     */
    it('testGridFriction', 0, async function (done) {
      console.info('[testGridFriction] START');
      globalThis.value.message.notify({name:'friction', value:-1})
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = getInspectorByKey('Grid_GridFriction');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      expect(gridContainerObj.$attrs.friction).assertEqual(0.6);
      console.info('[testGridFriction] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_GRID_GRIDFRICTION_002
     * @tc.name      testGridFriction
     * @tc.desc      set friction to 10
     */
    it('testGridFriction', 0, async function (done) {
      console.info('[testGridFriction] START');
      globalThis.value.message.notify({name:'friction', value:10})
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = getInspectorByKey('Grid_GridFriction');
      let gridContainerObj = JSON.parse(gridContainerStrJson);
      expect(gridContainerObj.$type).assertEqual('Grid');
      expect(gridContainerObj.$attrs.friction).assertEqual(10);
      console.info('[testGridFriction] END');
      done();
    });
  })


}
