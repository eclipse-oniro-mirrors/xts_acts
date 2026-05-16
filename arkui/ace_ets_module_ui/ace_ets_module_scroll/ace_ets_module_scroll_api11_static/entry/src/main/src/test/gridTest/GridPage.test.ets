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
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function GridTest() {
  const SUITE = 'GridTest'

  describe('GridPageTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/grid/GridTestPage",
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("GridTestPage" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          await UtilsTest.msSleep(2000)
          // console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error " + JSON.stringify(err));
      }
    });

    /*
     *tc.number ArkUX_Grid_api_0001
     *tc.name   Test Grid with GridItemStyle.NONE
     *tc.desc   Test Grid with GridItemStyle.NONE
     */

    
    /**
     * @tc.number   ArkUX_Grid_api_static_0001
     * @tc.name     ArkUX_Grid_api_static_0001
     * @tc.desc     ArkUX_Grid_api_static_0001
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_api_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUX_Grid_api_static_0001'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = inspector.getInspectorByKey('Grid_GridItemStyle_NONE');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid')
      strJson = inspector.getInspectorByKey('GridItemStyle_NONE_11');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0002
     *tc.name   Test Grid with GridItemStyle.PLAIN
     *tc.desc   Test Grid with GridItemStyle.PLAIN
     */

    
    /**
     * @tc.number   ArkUX_Grid_api_static_0002
     * @tc.name     ArkUX_Grid_api_static_0002
     * @tc.desc     ArkUX_Grid_api_static_0002
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_api_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUX_Grid_api_static_0002'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = inspector.getInspectorByKey('Grid_GridItemStyle_PLAIN');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid')
      strJson = inspector.getInspectorByKey('GridItemStyle_PLAIN_11');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0003
     *tc.name   Test Grid with exceptional value
     *tc.desc   Test Grid with exceptional value
     */

    
    /**
     * @tc.number   ArkUX_Grid_api_static_0003
     * @tc.name     ArkUX_Grid_api_static_0003
     * @tc.desc     ArkUX_Grid_api_static_0003
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_api_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUX_Grid_api_static_0003'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = inspector.getInspectorByKey('Grid_GridItemStyle_EXCEPTION');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid')
      strJson = inspector.getInspectorByKey('GridItemStyle_EXCEPTION_NULL');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')
      strJson = inspector.getInspectorByKey('GridItemStyle_EXCEPTION_UNDEFINED');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')
      strJson = inspector.getInspectorByKey('GridItemStyle_EXCEPTION_MINUS_ONE');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')
      strJson = inspector.getInspectorByKey('GridItemStyle_EXCEPTION_TWO');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0004
     *tc.name   Test Grid with value not set
     *tc.desc   Test Grid with value not set
     */

    
    /**
     * @tc.number   ArkUX_Grid_api_static_0004
     * @tc.name     ArkUX_Grid_api_static_0004
     * @tc.desc     ArkUX_Grid_api_static_0004
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_api_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUX_Grid_api_static_0004'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = inspector.getInspectorByKey('Grid_GridItem_VALUE_NOT_SET');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid')
      strJson = inspector.getInspectorByKey('GridItem_VALUE_NOT_SET_11');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

    /*
     *tc.number ArkUX_Grid_api_0005
     *tc.name   Test Grid with exceptional value
     *tc.desc   Test Grid with exceptional value
     */

    
    /**
     * @tc.number   ArkUX_Grid_api_static_0005
     * @tc.name     ArkUX_Grid_api_static_0005
     * @tc.desc     ArkUX_Grid_api_static_0005
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Grid_api_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CASE = 'ArkUX_Grid_api_static_0005'
      console.info(`${SUITE} ${CASE} START`);
      let strJson = inspector.getInspectorByKey('Grid_GridItemStyle_VALUE');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Grid')
      strJson = inspector.getInspectorByKey('GridItem_value_empty');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')
      strJson = inspector.getInspectorByKey('GridItem_value_null');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')
      strJson = inspector.getInspectorByKey('GridItem_value_undefined');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridItem')

      console.info(`${SUITE} ${CASE} END`);
      done()
    });

  })
}
