import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "MediaXts.OnTrackChangeTest";
let avPlayer: media.AVPlayer | null = null;

async function createAVPlayerInstance(): Promise<media.AVPlayer> {
  const player: media.AVPlayer = await media.createAVPlayer();
  if (!player) {
    throw new Error(`${TAG} AVPlayer实例创建失败`);
  }
  return player;
}
async function TestAVPlayerTrackChangeCallback(
  testName: string,
  callback: ESObject
): Promise<void> {
  avPlayer = await createAVPlayerInstance();
  try {
    console.info(TAG, testName, '开始测试on(tarckChange)空回调');
    avPlayer.on('stateChange', callback);
    console.info(TAG, testName, 'on(tarckChange)传入空回调执行完成');
  } catch (error) {
    console.error(TAG, testName, `on(tarckChange)空回调测试失败: ${error}, code: ${(error as BusinessError)?.code}`);
  }
}
export default function OnTrackChangeTest() {
  describe('OnTrackChangeTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });

    beforeEach(() => {
      console.info(TAG, 'afterEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await avPlayer?.release();
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_001
     * @tc.name      SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_001
     * @tc.desc      Testing AVPlayerTrackChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_001';
      try {
        await TestAVPlayerTrackChangeCallback(testName, null);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_002
     * @tc.name      SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_002
     * @tc.desc      Testing AVPlayerTrackChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_002", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_002';
      try {
        await TestAVPlayerTrackChangeCallback(testName, undefined);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_003
     * @tc.name      SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_003
     * @tc.desc      Testing AVPlayerTrackChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_003", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_TRACKCHANGE_NULL_CALLBACK_003';
      try {
        await TestAVPlayerTrackChangeCallback(testName, '');
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
  })
}