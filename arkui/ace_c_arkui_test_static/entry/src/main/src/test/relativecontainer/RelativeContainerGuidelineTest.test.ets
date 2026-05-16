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

export default function relativeContainerGuidelineTest() {

  describe('RelativeContainerGuidelineTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionCreate001
     * @tc.name     testRelativeContainerGuidelineOptionCreate001
     * @tc.desc     testRelativeContainerGuidelineOptionCreate001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionCreate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionCreate001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionDispose001
     * @tc.name     testRelativeContainerGuidelineOptionDispose001
     * @tc.desc     testRelativeContainerGuidelineOptionDispose001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionDispose001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionDispose001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetId001
     * @tc.name     testRelativeContainerGuidelineOptionSetId001
     * @tc.desc     testRelativeContainerGuidelineOptionSetId001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetId001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetId001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetId002
     * @tc.name     testRelativeContainerGuidelineOptionSetId002
     * @tc.desc     testRelativeContainerGuidelineOptionSetId002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetId002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetId002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetId003
     * @tc.name     testRelativeContainerGuidelineOptionSetId003
     * @tc.desc     testRelativeContainerGuidelineOptionSetId003
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetId003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetId003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetId004
     * @tc.name     testRelativeContainerGuidelineOptionSetId004
     * @tc.desc     testRelativeContainerGuidelineOptionSetId004
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetId004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetId004()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionGetId001
     * @tc.name     testRelativeContainerGuidelineOptionGetId001
     * @tc.desc     testRelativeContainerGuidelineOptionGetId001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionGetId001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionGetId001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionGetId002
     * @tc.name     testRelativeContainerGuidelineOptionGetId002
     * @tc.desc     testRelativeContainerGuidelineOptionGetId002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionGetId002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionGetId002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetDirection001
     * @tc.name     testRelativeContainerGuidelineOptionSetDirection001
     * @tc.desc     testRelativeContainerGuidelineOptionSetDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetDirection001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionSetDirection002
     * @tc.name     testRelativeContainerGuidelineOptionSetDirection002
     * @tc.desc     testRelativeContainerGuidelineOptionSetDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionSetDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionSetDirection002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionGetDirection001
     * @tc.name     testRelativeContainerGuidelineOptionGetDirection001
     * @tc.desc     testRelativeContainerGuidelineOptionGetDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionGetDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionGetDirection001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerGuidelineOptionGetDirection002
     * @tc.name     testRelativeContainerGuidelineOptionGetDirection002
     * @tc.desc     testRelativeContainerGuidelineOptionGetDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerGuidelineOptionGetDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerGuidelineOptionGetDirection002()).assertEqual(0)
      done()
    })


    
    it('testRelativeContainerGuidelineOptionSetPositionStart001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionStart001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionStart002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionStart002()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionStart003', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionStart003()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionStart004', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionStart004()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionGetPositionStart001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionGetPositionStart001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionGetPositionStart002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionGetPositionStart002()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionEnd001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionEnd001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionEnd002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionEnd002()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionEnd003', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionEnd003()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionSetPositionEnd004', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionSetPositionEnd004()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionGetPositionEnd001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionGetPositionEnd001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerGuidelineOptionGetPositionEnd002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerGuidelineOptionGetPositionEnd002()).assertEqual(0)
        done()
      })
  })
}