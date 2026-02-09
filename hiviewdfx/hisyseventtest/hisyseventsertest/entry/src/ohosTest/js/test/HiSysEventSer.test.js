/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import hiSysEvent from '@ohos.hiSysEvent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'

export default function hiSysEventSerTest() {
describe('hiSysEventSerTest', function () {
    beforeAll(function() {
        console.info('hiSysEventSerTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventSerTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventSerTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventSerTest afterEach called')
    })

 /**
  * @tc.name   testHiSysEventApi33
  * @tc.number DFX_DFT_HiSysEvent_JS_3300
  * @tc.desc   验证调用write接口系统事件打点，hiview服务未成功启动，忽略事件打点，错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi33 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi33 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200003).assertTrue()
				} else {
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi33 end')
				done()
			})
		} catch (error) {
			console.error(`testHiSysEventApi33 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi67
  * @tc.number DFX_DFT_HiSysEvent_JS_6700
  * @tc.desc   验证调用addwatcher，hiview服务未成功启动，调用失败，返回错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi67 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		try {
			// @ts-ignore
			hiSysEvent.addWatcher(watcher)
		} catch (error) {
			console.error(`testHiSysEventApi67 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200003).assertTrue()
			console.info('testHiSysEventApi67 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi68
  * @tc.number DFX_DFT_HiSysEvent_JS_6800
  * @tc.desc   验证调用query，hiview服务未成功启动，调用失败，返回错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi68', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi68 start')
		try {
			hiSysEvent.query({
				beginTime: -1,
				endTime: -1,
				maxEvents: 5,
			}, [{
				domain: "HIVIEWDFX",
				names: ["SYS_USAGE","PLUGIN_STATS"],
			}], {
				onQuery: function (infos) {
				},
				onComplete: function(reason, total) {
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi68 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200003).assertTrue()
			console.info('testHiSysEventApi68 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventBox09
  * @tc.number DFX_DFT_HiSysevent_SandBox_0900
  * @tc.desc   验证调用exportSysEvents接口，关闭hiview进程，抛出错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventBox09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventBox09 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["SERVICE_BLOCK_REPORT"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200003).assertTrue()
			console.info('testHiSysEventBox09 end')
			done();
		}
	})

 /**
  * @tc.name   testHiSysEventBox23
  * @tc.number DFX_DFT_HiSysevent_SandBox_2300
  * @tc.desc   验证调用subscribe接口，关闭hiview进程，抛出错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventBox23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventBox23 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITY",
				names: ["CPP_CRASH_NO_LOG"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox21 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200003).assertTrue()
			console.info('testHiSysEventBox23 end')
			done();
		}
	})

 /**
  * @tc.name   testHiSysEventBox24
  * @tc.number DFX_DFT_HiSysevent_SandBox_2400
  * @tc.desc   验证调用unsubscribe接口，关闭hiview进程，抛出错误码11200003
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventBox24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventBox24 start')
		try {
			hiSysEvent.unsubscribe();
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox25 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200003).assertTrue()
			console.info('testHiSysEventBox24 end')
			done();
		}
	})
})
}
