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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function ListFrictionTest() {
  describe('ListFrictionTest',  ()=> {
    beforeEach(async  (done:Function)=> {
      console.info("ListFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListFrictionPage state pages:" + JSON.stringify(pages));
        if (!("ListFrictionPage" == pages.name)) {
          console.info("get ListFrictionPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListFrictionPage page error:" + err);
      }
      console.info("ListFrictionPage beforeEach end");
      done();
    });
    afterEach(async  ()=> {
      await CommonFunc.sleep(1000);
      console.info("ListFrictionPage after each called");
    });
    /**
     * @tc.name   testListFriction_0100
     * @tc.number testListFriction_0100
     * @tc.desc   set friction to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListFriction_0100',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testListFriction_0100] START');
      globalThis.value.message.notify({name:'friction', value:-1})
      await CommonFunc.sleep(2000);
      let listContainerStrJson = getInspectorByKey('List_ListFriction');
      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');
      console.info('[testListFriction_0100] listContainerStrJson friction: ' + JSON.parse(listContainerStrJson).$attrs.friction);
      let listDefJson = getInspectorByKey('list_friction_default');
      console.info('[testListFriction_0100] listDefJson friction: ' + JSON.parse(listDefJson).$attrs.friction);
      expect(JSON.parse(listContainerStrJson).$attrs.friction).assertEqual(JSON.parse(listDefJson).$attrs.friction);
      console.info('[testListFriction_0100] END');
      done();
    });

    /**
     * @tc.name   testListFriction_0200
     * @tc.number testListFriction_0200
     * @tc.desc   set friction to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListFriction_0200',  Level.LEVEL0, async  (done: Function)=> {
      console.info('[testListFriction_0200] START');
      globalThis.value.message.notify({name:'friction', value:10})
      await CommonFunc.sleep(2000);
      let listContainerStrJson = getInspectorByKey('List_ListFriction');
      expect(JSON.parse(listContainerStrJson).$type).assertEqual('List');
      expect(JSON.parse(listContainerStrJson).$attrs.friction).assertEqual(10);
      console.info('[testListFriction_0200] END');
      done();
    });
  })
}
