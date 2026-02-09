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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import { MessageManager, Callback } from '../MainAbility/common/MessageManager';

export default function GridFrictionTest() {
  describe('GridFrictionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridFrictionPage state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get GridFrictionPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridFrictionPage page error:" + err);
      }
      console.info("GridFrictionPage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GridFrictionPage after each called");
    });
    /**
     * @tc.name   testGridFriction_0100
     * @tc.number testGridFriction_0100
     * @tc.desc   set friction to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridFriction_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridFriction_0100] START');
      globalThis.value.message.notify({
        name: 'friction', value: -1
      })
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = getInspectorByKey('Grid_GridFriction');
      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      console.info('[testGridFriction_0100] gridContainerStrJson friction: ' + JSON.parse(gridContainerStrJson).$attrs.friction);
      let gridDefJson = getInspectorByKey('grid_friction_default');
      console.info('[testGridFriction_0100] gridDefJson friction: ' + JSON.parse(gridDefJson).$attrs.friction);
      expect(JSON.parse(gridContainerStrJson).$attrs.friction).assertEqual(JSON.parse(gridDefJson).$attrs.friction);
      console.info('[testGridFriction_0100] END');
      done();
    });

    /**
     * @tc.name   testGridFriction_0200
     * @tc.number testGridFriction_0200
     * @tc.desc   set friction to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGridFriction_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[testGridFriction_0200] START');
      globalThis.value.message.notify({
        name: 'friction', value: 10
      })
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = getInspectorByKey('Grid_GridFriction');
      expect(JSON.parse(gridContainerStrJson).$type).assertEqual('Grid');
      expect(JSON.parse(gridContainerStrJson).$attrs.friction).assertEqual(10);
      console.info('[testGridFriction_0200] END');
      done();
    });
  })
}
