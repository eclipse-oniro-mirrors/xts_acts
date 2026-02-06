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

export default function hiSysEventErrcodeTest() {
describe('hiSysEventErrcodeTest', function () {
    beforeAll(function() {
        console.info('hiSysEventErrcodeTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventErrcodeTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventErrcodeTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventErrcodeTest afterEach called')
    })

 /**
  * @tc.name   testHiSysEventApi27
  * @tc.number DFX_DFT_HiSysEvent_JS_2700
  * @tc.desc   验证调用write接口系统事件打点，领域名称长度超16个字符，忽略事件打点，错误码11200001
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi27 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY_RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi27 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi27 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi27 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi27 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi28
  * @tc.number DFX_DFT_HiSysEvent_JS_2800
  * @tc.desc   验证调用write接口系统事件打点，领域名称包含特殊字符，忽略事件打点，错误码11200001
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi28 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY#?",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi28 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi28 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi28 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi28 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi29
  * @tc.number DFX_DFT_HiSysEvent_JS_2900
  * @tc.desc   验证调用write接口系统事件打点，领域名称为空，忽略事件打点，错误码11200001。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi29 start')
		try {
			hiSysEvent.write({
				domain: "",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi29 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi29 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi29 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi29 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi30
  * @tc.number DFX_DFT_HiSysEvent_JS_3000
  * @tc.desc   验证调用write接口系统事件打点，系统事件名称长度超32个字符，忽略事件打点，错误码11200002。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi30 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK_STACK_STACK_STACK_STACK_STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi30 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi30 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi30 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi30 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi30 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi31
  * @tc.number DFX_DFT_HiSysEvent_JS_3100
  * @tc.desc   验证调用write接口系统事件打点，系统事件名称包含特殊字符，忽略事件打点，错误码11200002。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi31 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK#?",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi31 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi31 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi31 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi31 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi31 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi32
  * @tc.number DFX_DFT_HiSysEvent_JS_3200
  * @tc.desc   验证调用write接口系统事件打点，系统事件名称为空，忽略事件打点，错误码11200002。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
	it('testHiSysEventApi32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		console.info('testHiSysEventApi32 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi32 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi32 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi32 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi32 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi32 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi35
  * @tc.number DFX_DFT_HiSysEvent_JS_3500
  * @tc.desc   验证调用write接口系统事件打点，系统事件总长度超过384K，忽略事件打点，错误码11200004。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi35 start')
		try {
			let params = {
				PID: 1,
				UID: 1,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "just a testcase",
				MSG: "no msg."
			}
			for (let i = 0; i < 40; i++) {
				params[`bundle${i}`] = Array.from({length: 10 * 1024}).join("ohos")
			}
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params:params
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi35 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200004).assertTrue()
				} else {
					console.info(`in testHiSysEventApi35 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi35 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi35 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi35 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi36
  * @tc.number DFX_DFT_HiSysEvent_JS_3600
  * @tc.desc   验证调用write接口系统事件打点，领系统事件参数名称长度超32个字符，忽略事件打点，错误码11200051。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi36 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi36 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi36 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi36 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi36 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi36 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi37
  * @tc.number DFX_DFT_HiSysEvent_JS_3700
  * @tc.desc   验证调用write接口系统事件打点，系统事件参数名称包含特殊字符，忽略事件打点，错误码11200051。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi37 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					"STACK#?": "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi37 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi37 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi37 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi37 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi37 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi38
  * @tc.number DFX_DFT_HiSysEvent_JS_3800
  * @tc.desc   验证调用write接口系统事件打点，系统事件参数名称为空，忽略事件打点，错误码11200051。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi38 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					"": "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi38 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi38 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi38 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi38 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi38 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi39
  * @tc.number DFX_DFT_HiSysEvent_JS_3900
  * @tc.desc   验证调用write接口系统事件打点，字符串类型的参数值的长度超过10K，忽略事件打点，错误码11200052。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi39 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: Array.from({length: 10 * 1024 + 10}).join("ohos"),
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi39 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200052).assertTrue()
				} else {
					console.info(`in testHiSysEventApi39 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi39 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi39 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi39 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi40
  * @tc.number DFX_DFT_HiSysEvent_JS_4000
  * @tc.desc   验证调用write接口系统事件打点，系统事件的参数数量超过128个，忽略事件打点，错误码11200053。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi40 start')
		let largeParams = {}
		for (let i = 0; i < 200; i++) {
			largeParams["name" + i] = i
		}
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: largeParams
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi40 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200053).assertTrue()
				} else {
					console.info(`in testHiSysEventApi40 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi40 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi40 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi40 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi41
  * @tc.number DFX_DFT_HiSysEvent_JS_4100
  * @tc.desc   验证调用write接口系统事件打点，系统事件中有数组类型的参数值的长度超过100，忽略事件打点，错误码11200054。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi41 start')
		let msgArray = []
		for (let i = 0; i < 200; i++) {
			msgArray[i] = i
		}
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: msgArray
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi41 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200054).assertTrue()
				} else {
					console.info(`in testHiSysEventApi41 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi41 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi41 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi41 end')
			done()
		}
	})
 /**
  * @tc.name   testHiSysEventApi42
  * @tc.number DFX_DFT_HiSysEvent_JS_4200
  * @tc.desc   验证调用addWatcher接口添加系统事件监听者，监听者数量超过限制，拒绝添加此监听者，错误码11200101。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi42 start')
        var watcher = []
		try {
			for (var i = 0; i < 31; i++) {
				watcher[i] = {
					rules: [{
						domain: "RELIABILITY" + i,
						name: "STACK",
						ruleType: hiSysEvent.RuleType.WHOLE_WORD,
					}],
					onEvent: (info) => {
					},
					onServiceDied: () => {
					}
				}
				hiSysEvent.addWatcher(watcher[i])
			}
		}catch (err) {
			console.error(`testHiSysEventApi42 > addWatcher error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200101).assertTrue()
			console.info('testHiSysEventApi42 addWatcher end')
			done()
		}
        setTimeout(() => {
            try {
                for (var i = 0; i < 31; i++) {
                    hiSysEvent.removeWatcher(watcher[i])
                }
            }catch (err) {
                console.error(`testHiSysEventApi42 > remove error code: ${err.code}, error msg: ${err.message}`)
			    expect(err.code == 11200201).assertTrue()
			    console.info('testHiSysEventApi42 remove end')
			    done()
            }
        }, 5000)
        done()
	})

 /**
  * @tc.name   testHiSysEventApi43
  * @tc.number DFX_DFT_HiSysEvent_JS_4300
  * @tc.desc   验证调用addWatcher接口添加系统事件监听者，监听规则数量超过限制，拒绝添加此监听者，错误码11200102。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi43 start')
		let msgArray = []
		for (let i = 0; i < 21; i++) {
			msgArray[i] = {
				domain: "RELIABILITY" + i,
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}
		}
		try {
			let watcher = {
				rules: msgArray,
				onEvent: (info) => {
				},
				onServiceDied: () => {
				}
			}
			hiSysEvent.addWatcher(watcher)
			done()
		}catch (err) {
			console.error(`testHiSysEventApi43 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200102).assertTrue()
			console.info('testHiSysEventApi43 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi44
  * @tc.number DFX_DFT_HiSysEvent_JS_4400
  * @tc.desc   验证调用removeWatcher接口删除系统事件监听者，事件监听者为空，拒绝移除此监听者，错误码11200201。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi44 start')
		let watcher11 = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher("")
				expect(true).assertTrue()
				console.info('testHiSysEventApi44 end')
				done()
			}catch (err) {
				console.error(`testHiSysEventApi44 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200201).assertTrue()
				console.info('testHiSysEventApi44 end')
				done()
			}
		}, 1000)
	})

 /**
  * @tc.name   testHiSysEventApi45
  * @tc.number DFX_DFT_HiSysEvent_JS_4500
  * @tc.desc   验证调用removeWatcher接口删除系统事件监听者，事件监听者不在监听队列，拒绝移除此监听者，错误码11200201。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi45 start')
		let watcher11 = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher11)
				expect(true).assertTrue()
				console.info('testHiSysEventApi45 end')
				done()
			}catch (err) {
				console.error(`testHiSysEventApi45 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200201).assertTrue()
				console.info('testHiSysEventApi45 end')
				done()
			}
		}, 1000)
	})

 /**
  * @tc.name   testHiSysEventApi46
  * @tc.number DFX_DFT_HiSysEvent_JS_4600
  * @tc.desc   验证调用query接口查询系统事件，查询规则个数超过100个，忽略此次系统事件的查询，错误码11200301。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi46 start')
		setTimeout(() => {
			try {
				let msgArray = []
				for (let i = 0; i < 101; i++) {
					msgArray[i] = {
						domain: "RELIABILITY",
						names: ["STACK"],
					}
				}
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, msgArray, {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi46: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi46 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200301).assertTrue()
				console.info('hiSysEventJsUnitTest006 end')
				done()
			}
		}, 1000);
	})

 /**
  * @tc.name   testHiSysEventApi47
  * @tc.number DFX_DFT_HiSysEvent_JS_4700
  * @tc.desc   验证调用query接口查询系统事件，事件领域名称长度超过16个字符，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi47 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "RELIABILITY_RELIABILITY",
					names: ["STACK"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi47: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi47 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi47 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi48
  * @tc.number DFX_DFT_HiSysEvent_JS_4800
  * @tc.desc   验证调用query接口查询系统事件，事件名称长度超过32个字符，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi48 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "RELIABILITY",
					names: ["STACK_STACK_STACK_STACK_STACK_STACK"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi48: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi48 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi48 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi49
  * @tc.number DFX_DFT_HiSysEvent_JS_4900
  * @tc.desc   验证调用query接口查询系统事件，事件领域名称包含特殊字符，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi49 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "RELIABILITY?#",
					names: ["STACK"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi49: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi49 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi49 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi50
  * @tc.number DFX_DFT_HiSysEvent_JS_5000
  * @tc.desc   验证调用query接口查询系统事件，事件名称包含特殊字符，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi50 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "RELIABILITY",
					names: ["STACK?#"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi50: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi50 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi50 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi51
  * @tc.number DFX_DFT_HiSysEvent_JS_5100
  * @tc.desc   验证调用query接口查询系统事件，事件领域名称为空，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi51 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "",
					names: ["STACK"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi51: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi51 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi51 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi52
  * @tc.number DFX_DFT_HiSysEvent_JS_5200
  * @tc.desc   验证调用query接口查询系统事件，事件名称为空，忽略此次系统事件的查询，错误码11200302。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi52 start')
		setTimeout(() => {
			try {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 2,
				}, [{
					domain: "RELIABILITY" ,
					names: [],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi52: reason is ${reason}, total is ${total}`)
						expect(reason != 0).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi52 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200302 || err.code == 11200304).assertTrue()
				console.info('testHiSysEventApi52 end')
				done()
			}
		}, 2000);
	})

 /**
  * @tc.name   testHiSysEventApi53
  * @tc.number DFX_DFT_HiSysEvent_JS_5300
  * @tc.desc   验证调用write接口，缺少write参数，无法打点，错误码401。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi53 start')
		try {
			hiSysEvent.write({}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi53 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi53 test callback: result = ' + val)
				}
			})
		} catch (err) {
			console.error(`testHiSysEventApi53 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 401).assertTrue()
			console.info('testHiSysEventApi53 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi54
  * @tc.number DFX_DFT_HiSysEvent_JS_5400
  * @tc.desc   验证调用query接口，缺少订阅规则，错误码401。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi54 start')
		setTimeout(() => {
			try {
				hiSysEvent.query( {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi54: reason is ${reason}, total is ${total}`)
						expect(false).assertTrue()
						done()
					}
				})
			} catch (err) {
				console.error(`testHiSysEventApi54 delay > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 401).assertTrue()
				console.info('testHiSysEventApi54 end')
				done()
			}
		}, 1000);
	})

 /**
  * @tc.name   testHiSysEventApi55
  * @tc.number DFX_DFT_HiSysEvent_JS_5500
  * @tc.desc   验证调用addwatcher接口，缺少watcher参数，错误码401。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi55 start')
		try {
			let watcher = {
				onEvent: (info) => {
					console.info(`testHiSysEventApi12: OnEvent...`)
					expect(Object.keys(info).length > 0).assertTrue()
					console.info(`testHiSysEventApi12: domain is : ${info.domain}, name is ${info.name},
				                                               eventType is ${info.eventType}`)
					if (info.params instanceof Object) {
						for (const key in info.params) {
							console.info(`testHiSysEventApi12: ${key}: ${info.params[key]}`)
						}
					}
				},
				onServiceDied: () => {
					console.info(`testHiSysEventApi12 Onservice died`);
				}
			}
			hiSysEvent.addWatcher(watcher)
		} catch (err) {
			console.error(`testHiSysEventApi55 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 401).assertTrue()
			console.info('testHiSysEventApi55 end')
			done()
		}
	})

 /**
  * @tc.name   testHiSysEventApi57
  * @tc.number DFX_DFT_HiSysEvent_JS_5700
  * @tc.desc   验证调用query接口，查询频率超过限制，忽略此次查询，错误码11200304。。
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
	it('testHiSysEventApi57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
		console.info('testHiSysEventApi57 start')
		try {
			for (let i = 0; i < 51; i++) {
				hiSysEvent.query({
					beginTime: 1686827195833,
					endTime: 1686827195834,
					maxEvents: 1,
				}, [{
					domain: "HIVIEWDFX" ,
					names: ["SYS_USAGE"],
				}], {
					onQuery: function (infos) {
					},
					onComplete: function(reason, total) {
					}
				})
			}
		} catch (err) {
			console.error(`testHiSysEventApi57 delay > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200304).assertTrue()
			console.info('testHiSysEventApi57 end')
			done()
		}
	})
})
}