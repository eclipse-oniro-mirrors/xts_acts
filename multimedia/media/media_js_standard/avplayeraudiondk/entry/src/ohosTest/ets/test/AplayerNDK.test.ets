/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import aplayerTest from 'libentry.so'

export default function APlayerNDKTest() {
  describe('ActsAPlayerNDKTest', () => {
    let Tag = "APlayerNDKTest"
    beforeAll(() => {
      console.info('beforeAll case');
    })
    beforeEach(() => {
      console.info('beforeEach case');
    })
    afterEach(() => {
      console.info('afterEach case');
    })
    afterAll(() => {
      console.info('afterAll case');
    })

    /* *
           * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100
           * @tc.name      : OH_PLAYER_PlayerStateSetURLSource_001
           * @tc.desc      : Test OH_AVPlayer_SetURLSource
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level0
       */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSetURLSource();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100-------------PlayerStateSetURLSource:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200
          * @tc.name      : OH_PLAYER_PlayerStatePrepare_002
          * @tc.desc      : Test OH_AVPlayer_Prepare
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStatePrepare();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200-------------PlayerStatePrepare:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300
          * @tc.name      : OH_PLAYER_PlayerStatePlayer_003
          * @tc.desc      : Test OH_AVPlayer_Play
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStatePlayer();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300-------------PlayerStatePlayer:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400
          * @tc.name      : OH_PLAYER_PlayerStatePause_004
          * @tc.desc      : Test OH_AVPlayer_Pause
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStatePause();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400-------------PlayerStatePause:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500
          * @tc.name      : OH_PLAYER_PlayerStateStop_005
          * @tc.desc      : Test OH_AVPlayer_Stop
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateStop();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500-------------PlayerStateStop:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600
          * @tc.name      : OH_PLAYER_PlayerStateReset_006
          * @tc.desc      : Test OH_AVPlayer_Reset
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateReset();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600-------------PlayerStateReset:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700
          * @tc.name      : OH_PLAYER_PlayerStateSetvolume_007
          * @tc.desc      : Test OH_AVPlayer_Setvolume
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSetvolume();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700-------------PlayerStateSetvolume:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800
          * @tc.name      : OH_PLAYER_PlayerStateSeek_008
          * @tc.desc      : Test OH_AVPlayer_Seek
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSeek();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800-------------PlayerStateSeek:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900
          * @tc.name      : OH_PLAYER_PlayerStateGetCurrentTime_009
          * @tc.desc      : Test OH_AVPlayer_GetCurrentTime
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateGetCurrentTime();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900-------------PlayerStateGetCurrentTime:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000
          * @tc.name      : OH_PLAYER_PlayerStateSetSpeed_010
          * @tc.desc      : Test OH_AVPlayer_SetSpeed
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000-------------PlayerStateSetSpeed:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100
          * @tc.name      : OH_PLAYER_PlayerStateGetSpeed_011
          * @tc.desc      : Test OH_AVPlayer_GetSpeed
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateGetSpeed();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100-------------PlayerStateGetSpeed:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200
          * @tc.name      : OH_PLAYER_PlayerStateIsPlaying_012
          * @tc.desc      : Test OH_AVPlayer_IsPlaying
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateIsPlaying();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200-------------PlayerStateIsPlaying:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300
          * @tc.name      : OH_PLAYER_PlayerStateGetDuration_013
          * @tc.desc      : Test OH_AVPlayer_GetDuration
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateGetDuration();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300-------------PlayerStateGetDuration:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400
          * @tc.name      : OH_PLAYER_PlayerStateLoop_014
          * @tc.desc      : Test OH_AVPlayer_Loop
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateLoop();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /* *
          * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1500
          * @tc.name      : OH_PLAYER_PlayerStateLoop_014
          * @tc.desc      : Test OH_AVPlayer_Loop
          * @tc.size      : MediumTest
          * @tc.type      : Function test
          * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1500', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed_1_25_X();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })

      /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1600
        * @tc.name      : OH_PLAYER_PlayerStateLoop_014
        * @tc.desc      : Test OH_AVPlayer_Loop
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
      */
  it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1600', 0, async (done: Function) => {
    let a = aplayerTest.PlayerStateSetSpeed_1_75_X();
    console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
    expect(a).assertEqual(0)
    done()
  })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1700
        * @tc.name      : OH_PLAYER_PlayerStateLoop_014
        * @tc.desc      : Test OH_AVPlayer_Loop
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
      */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1700', 0, async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed_2_00_X();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })
  })
}