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

export default function relativeContainerBarrierTest() {

  describe('RelativeContainerBarrierTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionCreate001
     * @tc.name     testRelativeContainerBarrierOptionCreate001
     * @tc.desc     testRelativeContainerBarrierOptionCreate001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionCreate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionCreate001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionDispose001
     * @tc.name     testRelativeContainerBarrierOptionDispose001
     * @tc.desc     testRelativeContainerBarrierOptionDispose001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionDispose001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionDispose001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetId001
     * @tc.name     testRelativeContainerBarrierOptionSetId001
     * @tc.desc     testRelativeContainerBarrierOptionSetId001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetId001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetId001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetId002
     * @tc.name     testRelativeContainerBarrierOptionSetId002
     * @tc.desc     testRelativeContainerBarrierOptionSetId002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetId002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetId002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetId003
     * @tc.name     testRelativeContainerBarrierOptionSetId003
     * @tc.desc     testRelativeContainerBarrierOptionSetId003
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetId003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetId003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetId004
     * @tc.name     testRelativeContainerBarrierOptionSetId004
     * @tc.desc     testRelativeContainerBarrierOptionSetId004
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetId004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetId004()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionGetId001
     * @tc.name     testRelativeContainerBarrierOptionGetId001
     * @tc.desc     testRelativeContainerBarrierOptionGetId001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionGetId001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionGetId001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionGetId002
     * @tc.name     testRelativeContainerBarrierOptionGetId002
     * @tc.desc     testRelativeContainerBarrierOptionGetId002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionGetId002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionGetId002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection001
     * @tc.name     testRelativeContainerBarrierOptionSetDirection001
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection002
     * @tc.name     testRelativeContainerBarrierOptionSetDirection002
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection003
     * @tc.name     testRelativeContainerBarrierOptionSetDirection003
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection003
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection004
     * @tc.name     testRelativeContainerBarrierOptionSetDirection004
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection004
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection004()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection005
     * @tc.name     testRelativeContainerBarrierOptionSetDirection005
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection005
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection005()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionSetDirection006
     * @tc.name     testRelativeContainerBarrierOptionSetDirection006
     * @tc.desc     testRelativeContainerBarrierOptionSetDirection006
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionSetDirection006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionSetDirection006()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionGetDirection001
     * @tc.name     testRelativeContainerBarrierOptionGetDirection001
     * @tc.desc     testRelativeContainerBarrierOptionGetDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionGetDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionGetDirection001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testRelativeContainerBarrierOptionGetDirection002
     * @tc.name     testRelativeContainerBarrierOptionGetDirection002
     * @tc.desc     testRelativeContainerBarrierOptionGetDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testRelativeContainerBarrierOptionGetDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRelativeContainerBarrierOptionGetDirection002()).assertEqual(0)
      done()
    })


    
    it('testRelativeContainerBarrierOptionSetReferencedId001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionSetReferencedId001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionSetReferencedId002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionSetReferencedId002()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionSetReferencedId003', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionSetReferencedId003()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionGetReferencedId001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionGetReferencedId001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionGetReferencedId002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionGetReferencedId002()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionGetReferencedId003', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionGetReferencedId003()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionGetReferencedSize001', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionGetReferencedSize001()).assertEqual(0)
        done()
      })


    
    it('testRelativeContainerBarrierOptionGetReferencedSize002', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        expect(libUtil.testRelativeContainerBarrierOptionGetReferencedSize002()).assertEqual(0)
        done()
      })
  })
}