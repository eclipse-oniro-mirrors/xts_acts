/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ShapeNullUndefined5Test() {
  describe('ShapeNullUndefined5Test', () => {
    beforeAll(async (done: Function) => {
      console.info("ShapeNullUndefined5Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Shape/ShapeNullUndefined5",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ShapeNullUndefined5 state pages: " + JSON.stringify(pages));
        if (!("ShapeNullUndefined5" == pages.name)) {
          console.info("get ShapeNullUndefined5 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ShapeNullUndefined5 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShapeNullUndefined5 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   shapeMeshNull_0100
     * @tc.number SUB_ARKUI_SHAPE_MESH_NULL_0100
     * @tc.desc   Test Shape mesh method with null parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshNull_0100', Level.LEVEL0, async () => {
      console.info('[shapeMeshNull_0100] START');

      let strJson = getInspectorByKey('shape_mesh_null_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshNull_0100] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      expect(obj.$attrs.mesh.column).assertEqual(2);
      expect(obj.$attrs.mesh.row).assertEqual(2);
      console.info('[shapeMeshNull_0100] END');
    })

    /**
     * @tc.name   shapeMeshUndefined_0100
     * @tc.number SUB_ARKUI_SHAPE_MESH_UNDEFINED_0100
     * @tc.desc   Test Shape mesh method with undefined parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshUndefined_0100', Level.LEVEL0, async () => {
      console.info('[shapeMeshUndefined_0100] START');

      let strJson = getInspectorByKey('shape_mesh_undefined_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshUndefined_0100] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      expect(obj.$attrs.mesh.column).assertEqual(2);
      expect(obj.$attrs.mesh.row).assertEqual(2);
      console.info('[shapeMeshUndefined_0100] END');
    })

    /**
     * @tc.name   shapeMeshEmpty_0100
     * @tc.number SUB_ARKUI_SHAPE_MESH_EMPTY_0100
     * @tc.desc   Test Shape mesh method with empty array parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshEmpty_0100', Level.LEVEL0, async () => {
      console.info('[shapeMeshEmpty_0100] START');

      let strJson = getInspectorByKey('shape_mesh_empty_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshEmpty_0100] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      console.info('[shapeMeshEmpty_0100] END');
    })

    /**
     * @tc.name   shapeMeshValid_0100
     * @tc.number SUB_ARKUI_SHAPE_MESH_VALID_0100
     * @tc.desc   Test Shape mesh method with valid array parameter, should work correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshValid_0100', Level.LEVEL0, async () => {
      console.info('[shapeMeshValid_0100] START');

      let strJson = getInspectorByKey('shape_mesh_valid_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshValid_0100] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value[0]).assertEqual('0.000000');
      expect(obj.$attrs.mesh.column).assertEqual(2);
      expect(obj.$attrs.mesh.row).assertEqual(2);
      console.info('[shapeMeshValid_0100] END');
    })

    /**
     * @tc.name   shapeMeshNull_0200
     * @tc.number SUB_ARKUI_SHAPE_MESH_NULL_0200
     * @tc.desc   Test Shape mesh method with null parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshNull_0200', Level.LEVEL0, async () => {
      console.info('[shapeMeshNull_0200] START');

      let strJson = getInspectorByKey('shape_mesh_null_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshNull_0200] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      console.info('[shapeMeshNull_0200] END');
    })

    /**
     * @tc.name   shapeMeshUndefined_0200
     * @tc.number SUB_ARKUI_SHAPE_MESH_UNDEFINED_0200
     * @tc.desc   Test Shape mesh method with undefined parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshUndefined_0200', Level.LEVEL0, async () => {
      console.info('[shapeMeshUndefined_0200] START');

      let strJson = getInspectorByKey('shape_mesh_undefined_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshUndefined_0200] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      console.info('[shapeMeshUndefined_0200] END');
    })


    /**
     * @tc.name   shapeMeshNull_0300
     * @tc.number SUB_ARKUI_SHAPE_MESH_NULL_0300
     * @tc.desc   Test Shape mesh method with null parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshNull_0300', Level.LEVEL0, async () => {
      console.info('[shapeMeshNull_0300] START');

      let strJson = getInspectorByKey('shape_mesh_null_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshNull_0300] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      console.info('[shapeMeshNull_0300] END');
    })

    /**
     * @tc.name   shapeMeshUndefined_0300
     * @tc.number SUB_ARKUI_SHAPE_MESH_UNDEFINED_0300
     * @tc.desc   Test Shape mesh method with undefined parameter, should be treated as invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('shapeMeshUndefined_0300', Level.LEVEL0, async () => {
      console.info('[shapeMeshUndefined_0300] START');

      let strJson = getInspectorByKey('shape_mesh_undefined_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[shapeMeshUndefined_0300] obj.$attrs.mesh:' + JSON.stringify(obj.$attrs.mesh));
      expect(obj.$attrs.mesh.value.toString()).assertEqual('');
      console.info('[shapeMeshUndefined_0300] END');
    })
  })
}
