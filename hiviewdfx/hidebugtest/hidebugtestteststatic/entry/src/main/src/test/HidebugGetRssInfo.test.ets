import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { hidebug } from "@kit.PerformanceAnalysisKit";

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function hidebugGetRssInfoTest() {

    describe("hidebugGetRssInfoTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.number SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001
         * @tc.name testHidebugGetRssinfo01
         * @tc.desc hidebug.getRssInfo动态接口测试
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHidebugGetRssinfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            // console.info("====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 start");
            try {
                const info =  hidebug.getRssInfo();
                hilog.error(domain, tag, 'rss(%{public}s) rssSwap(%{public}s)',
                    info.rss.toString(), info.swapRss.toString());
                expect(Number(info.rss)).assertLargerOrEqual(0)
                expect(Number(info.swapRss)).assertLargerOrEqual(0)
                done();
            } catch (err) {
                hilog.error(domain, tag, 'Error: %{public}s', err.message);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain,tag,'%{public}s',"====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 end");
        });
        /**
         * @tc.number SUB_DFX_DFR_HIDEBUG_GETRSSINFO_003
         * @tc.name testHidebugGetRssinfo02
         * @tc.desc hidebug.getRssInfo动态接口稳定性测试
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHidebugGetRssinfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
            hilog.info(domain,tag,"====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_001 start");
            for (let i = 0; i < 100; i++) {
                try {
                    const info =  hidebug.getRssInfo();
                    hilog.error(domain, tag, 'rss(%{public}s) rssSwap(%{public}s)',
                        info.rss.toString(), info.swapRss.toString());
                    expect(Number(info.rss)).assertLargerOrEqual(0)
                    expect(Number(info.swapRss)).assertLargerOrEqual(0)
                    done();
                } catch (err) {
                    hilog.error(domain, tag, 'Error: %{public}s', err.message);
                    expect(false).assertTrue();
                    done();
                }
            }
            hilog.info(domain,tag,"====> SUB_DFX_DFR_HIDEBUG_GETRSSINFO_003 end");
        });

    })

}