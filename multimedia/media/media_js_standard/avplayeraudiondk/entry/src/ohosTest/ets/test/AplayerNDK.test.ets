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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
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

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100
     * @tc.desc   Test OH_AVPlayer_SetURLSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSetURLSource();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEtURLSOURCE_0100-------------PlayerStateSetURLSource:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200
     * @tc.desc   Test OH_AVPlayer_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStatePrepare();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PREPARE_0200-------------PlayerStatePrepare:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300
     * @tc.desc   Test OH_AVPlayer_Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStatePlayer();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PLAYER_0300-------------PlayerStatePlayer:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400
     * @tc.desc   Test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStatePause();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_PAUSE_0400-------------PlayerStatePause:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500
     * @tc.desc   Test OH_AVPlayer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateStop();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_STOP_0500-------------PlayerStateStop:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600
     * @tc.desc   Test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateReset();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_RESET_0600-------------PlayerStateReset:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700
     * @tc.desc   Test OH_AVPlayer_Setvolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSetvolume();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETVOLUME_0700-------------PlayerStateSetvolume:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800
     * @tc.desc   Test OH_AVPlayer_Seek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSeek();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SEEK_0800-------------PlayerStateSeek:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900
     * @tc.desc   Test OH_AVPlayer_GetCurrentTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateGetCurrentTime();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_CURRENTTIME_0900-------------PlayerStateGetCurrentTime:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000
     * @tc.desc   Test OH_AVPlayer_SetSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1000-------------PlayerStateSetSpeed:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100
     * @tc.desc   Test OH_AVPlayer_GetSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateGetSpeed();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_GETSPEED_1100-------------PlayerStateGetSpeed:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200
     * @tc.desc   Test OH_AVPlayer_IsPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateIsPlaying();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_ISPLAY_1200-------------PlayerStateIsPlaying:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300
     * @tc.desc   Test OH_AVPlayer_GetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateGetDuration();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_DURATION_1300-------------PlayerStateGetDuration:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400
     * @tc.desc   Test OH_AVPlayer_Loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateLoop();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1500
     * @tc.desc   Test OH_AVPlayer_Loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1500', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed_1_25_X();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })

  /**
   * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1600
   * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1600
   * @tc.desc   Test OH_AVPlayer_Loop
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1600', Level.LEVEL0,async (done: Function) => {
    let a = aplayerTest.PlayerStateSetSpeed_1_75_X();
    console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
    expect(a).assertEqual(0)
    done()
  })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1700
     * @tc.number SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1700
     * @tc.desc   Test OH_AVPlayer_Loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AUDIONDK_SETSPEED_1700', Level.LEVEL0,async (done: Function) => {
      let a = aplayerTest.PlayerStateSetSpeed_2_00_X();
      console.info(Tag + "SUB_MULTIMEDIA_PLAYER_AUDIONDK_LOOP_1400-------------PlayerStateLoop:" + a);
      expect(a).assertEqual(0)
      done()
    })
  })
}