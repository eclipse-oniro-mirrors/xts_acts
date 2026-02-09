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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAccessibilityRoleTest() {

  describe('CommonAttrsAccessibilityRoleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsAccessibilityRole001
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYROLE_0100
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_CUSTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole002
     * @tc.number SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYROLE_0200
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole003
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0300
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_SPAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole004
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0400
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE_SPAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole005
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0500
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole006
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0600
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TOGGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole007
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0700
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_LOADING_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole008
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0800
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT_INPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole009
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0900
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole010
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1000
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_BUTTON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole011
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1100
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_PROGRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole012
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1200
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_CHECKBOX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole013
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1300
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_XCOMPONENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole014
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1400
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_DATE_PICKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole015
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1500
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TIME_PICKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole016
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1600
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_TIME_PICKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole017
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1700
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_CALENDAR_PICKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole018
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1800
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_SLIDER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole019
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1900
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_RADIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole020
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2000
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE_ANIMATOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole021
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2100
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_STACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole022
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2200
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_SWIPER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole023
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2300
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_SCROLLARKUI_NODE_SCROLL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole024
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2400
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_LIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole025
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2500
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_LIST_ITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole026
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2600
     * @tc.desc   testing accessibilty role for commonattrs with valid value  ARKUI_NODE_LIST_ITEM_GROUP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole027
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2700
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_COLUMN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole028
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2800
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_ROW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole029
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2900
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_FLEX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole030
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3000
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_REFRESH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole031
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3100
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_WATER_FLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole032
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3200
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_WATER_FLOW_ITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole033
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3300
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_RELATIVE_CONTAINER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole034
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3400
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_GRID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole035
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3500
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_GRID_ITEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole036
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3600
     * @tc.desc   testing accessibilty role for commonattrs with valid value ARKUI_NODE_CUSTOM_SPAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole037
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3700
     * @tc.desc   testing accessibilty role for commonattrs with invalid value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole038
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3800
     * @tc.desc   testing accessibilty role for commonattrs with invalid value 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole039
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3900
     * @tc.desc   testing accessibilty role for commonattrs with invalid value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole040
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4000
     * @tc.desc   testing accessibilty role for commonattrs with invalid value 1016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole041
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4100
     * @tc.desc   testing accessibilty role for commonattrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsAccessibilityRole042
     * @tc.number SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4200
     * @tc.desc   testing resetAttribute accessibilty role for commonattrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsAccessibilityRole042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole042()).assertEqual(0)
      done()
    })
  })
}

