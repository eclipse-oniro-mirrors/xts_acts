/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'

export default function GridTest() {
  const SUITE = 'GridTest'

  describe('GridPageTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/grid/GridTestPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("GridTestPage" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error " + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0001
     *tc.name   Test Grid with GridItemStyle.NONE
     *tc.desc   Test Grid with GridItemStyle.NONE
     */
    it('ArkUX_Grid_api_0001', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUX_Grid_api_0001'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = getInspectorByKey('Grid_GridItemStyle_NONE');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid')
      strJson = getInspectorByKey('GridItemStyle_NONE_11');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0002
     *tc.name   Test Grid with GridItemStyle.PLAIN
     *tc.desc   Test Grid with GridItemStyle.PLAIN
     */
    it('ArkUX_Grid_api_0002', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUX_Grid_api_0002'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = getInspectorByKey('Grid_GridItemStyle_PLAIN');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid')
      strJson = getInspectorByKey('GridItemStyle_PLAIN_11');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0003
     *tc.name   Test Grid with exceptional value
     *tc.desc   Test Grid with exceptional value
     */
    it('ArkUX_Grid_api_0003', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUX_Grid_api_0003'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = getInspectorByKey('Grid_GridItemStyle_EXCEPTION');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid')
      strJson = getInspectorByKey('GridItemStyle_EXCEPTION_NULL');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')
      strJson = getInspectorByKey('GridItemStyle_EXCEPTION_UNDEFINED');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')
      strJson = getInspectorByKey('GridItemStyle_EXCEPTION_MINUS_ONE');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')
      strJson = getInspectorByKey('GridItemStyle_EXCEPTION_TWO');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0004
     *tc.name   Test Grid with value not set
     *tc.desc   Test Grid with value not set
     */
     it('ArkUX_Grid_api_0004', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUX_Grid_api_0004'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = getInspectorByKey('Grid_GridItem_VALUE_NOT_SET');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid')
      strJson = getInspectorByKey('GridItem_VALUE_NOT_SET_11');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0005
     *tc.name   Test Grid with exceptional value
     *tc.desc   Test Grid with exceptional value
     */
     it('ArkUX_Grid_api_0005', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUX_Grid_api_0005'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = getInspectorByKey('Grid_GridItemStyle_VALUE');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid')
      strJson = getInspectorByKey('GridItem_value_empty');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')
      strJson = getInspectorByKey('GridItem_value_null');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')
      strJson = getInspectorByKey('GridItem_value_undefined');
      obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
