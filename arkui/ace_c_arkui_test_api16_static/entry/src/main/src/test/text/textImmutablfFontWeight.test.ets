'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function textImmutablfFontWeight() {

  describe('textImmutablfFontWeight', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0100
     * @tc.name       : textImmutablfFontWeight_001
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The input invalid value is 850.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_001
     * @tc.name     textImmutablfFontWeight_001
     * @tc.desc     textImmutablfFontWeight_001
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0200
     * @tc.name       : textImmutablfFontWeight_002
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value AKUI_FONT_WEIGHT_W100 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_002
     * @tc.name     textImmutablfFontWeight_002
     * @tc.desc     textImmutablfFontWeight_002
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0300
     * @tc.name       : textImmutablfFontWeight_003
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value AKUI_FONT_WEIGHT_W200 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_003
     * @tc.name     textImmutablfFontWeight_003
     * @tc.desc     textImmutablfFontWeight_003
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0400
     * @tc.name       : textImmutablfFontWeight_004
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W300 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_004
     * @tc.name     textImmutablfFontWeight_004
     * @tc.desc     textImmutablfFontWeight_004
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0500
     * @tc.name       : textImmutablfFontWeight_005
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W400 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_005
     * @tc.name     textImmutablfFontWeight_005
     * @tc.desc     textImmutablfFontWeight_005
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0600
     * @tc.name       : textImmutablfFontWeight_006
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W500 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_006
     * @tc.name     textImmutablfFontWeight_006
     * @tc.desc     textImmutablfFontWeight_006
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0700
     * @tc.name       : textImmutablfFontWeight_007
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W600 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_007
     * @tc.name     textImmutablfFontWeight_007
     * @tc.desc     textImmutablfFontWeight_007
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0800
     * @tc.name       : textImmutablfFontWeight_008
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W700 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_008
     * @tc.name     textImmutablfFontWeight_008
     * @tc.desc     textImmutablfFontWeight_008
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_0900
     * @tc.name       : textImmutablfFontWeight_009
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W800 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_009
     * @tc.name     textImmutablfFontWeight_009
     * @tc.desc     textImmutablfFontWeight_009
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1000
     * @tc.name       : textImmutablfFontWeight_010
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_W900 is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_010
     * @tc.name     textImmutablfFontWeight_010
     * @tc.desc     textImmutablfFontWeight_010
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1100
     * @tc.name       : textImmutablfFontWeight_011
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_BOLD is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_011
     * @tc.name     textImmutablfFontWeight_011
     * @tc.desc     textImmutablfFontWeight_011
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1200
     * @tc.name       : textImmutablfFontWeight_012
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_NORMAL is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_012
     * @tc.name     textImmutablfFontWeight_012
     * @tc.desc     textImmutablfFontWeight_012
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1300
     * @tc.name       : textImmutablfFontWeight_013
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_BOLDER is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_013
     * @tc.name     textImmutablfFontWeight_013
     * @tc.desc     textImmutablfFontWeight_013
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1400
     * @tc.name       : textImmutablfFontWeight_014
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_LIGHTER is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_014
     * @tc.name     textImmutablfFontWeight_014
     * @tc.desc     textImmutablfFontWeight_014
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1500
     * @tc.name       : textImmutablfFontWeight_015
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_MEDIUM is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_015
     * @tc.name     textImmutablfFontWeight_015
     * @tc.desc     textImmutablfFontWeight_015
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_textImmutablfFontWeight_1600
     * @tc.name       : textImmutablfFontWeight_016
     * @tc.desc       : The text component supports the configuration 
                          that does not follow the infinite weight. 
                          The normal value ARKUI_FONT_WEIGHT_REGULAR is transferred.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textImmutablfFontWeight_016
     * @tc.name     textImmutablfFontWeight_016
     * @tc.desc     textImmutablfFontWeight_016
     * @tc.level    Level.LEVEL1
     */
    it('textImmutablfFontWeight_016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.textImmutablfFontWeight_016()).assertEqual(0)
      done()
    })
  })
}