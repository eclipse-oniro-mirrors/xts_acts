/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

class CustomData {
    id: int = 0;
    name: string = "";
}

export default function MessageEqualsTest(): void {
    describe("MessageEqualsTest", (): void => {

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_BASIC_0100
         * @tc.name testEqualsWithSameHandlerAndWhat
         * @tc.desc Test Message.equals with same handler and what value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testEqualsWithSameHandlerAndWhat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithSameHandlerAndWhat';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_BASIC_0200
         * @tc.name testEqualsWithSameHandlerWhatAndObj
         * @tc.desc Test Message.equals with same handler, what and obj
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testEqualsWithSameHandlerWhatAndObj", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithSameHandlerWhatAndObj';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 2;
                    const obj: string = "hello";
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_BASIC_0300
         * @tc.name testEqualsWithDifferentHandler
         * @tc.desc Test Message.equals with different handlers returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testEqualsWithDifferentHandler", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithDifferentHandler';
                console.info(`${TAG} test start`);
                const eaw1 = new EAWorker();
                const eaw2 = new EAWorker();
                eaw1.start();
                eaw2.start();

                try {
                    const handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw1);

                    const handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw2);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, handler1);
                    const msg2 = new concurrency.Message(what, handler2);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw1.quit();
                        eaw2.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_BASIC_0400
         * @tc.name testEqualsWithDifferentWhat
         * @tc.desc Test Message.equals with different what values returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testEqualsWithDifferentWhat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithDifferentWhat';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg1 = new concurrency.Message(1, handler);
                    const msg2 = new concurrency.Message(2, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_BASIC_0500
         * @tc.name testEqualsWithDifferentObj
         * @tc.desc Test Message.equals with different obj values returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testEqualsWithDifferentObj", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithDifferentObj';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, "hello", handler);
                    const msg2 = new concurrency.Message(what, "world", handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_CALLBACK_0100
         * @tc.name testEqualsWithSameCallback
         * @tc.desc Test Message.equals with same callback function
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithSameCallback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithSameCallback';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback = (): void => {
                        console.info("callback executed");
                    };

                    const msg1 = new concurrency.Message(callback, handler);
                    const msg2 = new concurrency.Message(callback, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_CALLBACK_0200
         * @tc.name testEqualsWithDifferentCallback
         * @tc.desc Test Message.equals with different callback functions returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithDifferentCallback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithDifferentCallback';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback1 = (): void => {
                        console.info("callback 1");
                    };

                    const callback2 = (): void => {
                        console.info("callback 2");
                    };

                    const msg1 = new concurrency.Message(callback1, handler);
                    const msg2 = new concurrency.Message(callback2, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_DEFAULT_0100
         * @tc.name testEqualsWithDefaultConstructor
         * @tc.desc Test Message.equals with default constructor (no what and obj)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithDefaultConstructor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithDefaultConstructor';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg1 = new concurrency.Message(handler);
                    const msg2 = new concurrency.Message(handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_TYPE_0100
         * @tc.name testEqualsWithNumberObj
         * @tc.desc Test Message.equals with number object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithNumberObj", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithNumberObj';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: int = 42;
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_TYPE_0200
         * @tc.name testEqualsWithBooleanObj
         * @tc.desc Test Message.equals with boolean object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithBooleanObj", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithBooleanObj';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: boolean = true;
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_COMPLEX_0100
         * @tc.name testEqualsWithCustomObject
         * @tc.desc Test Message.equals with custom object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsWithCustomObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithCustomObject';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj = new CustomData();
                    obj.id = 100;
                    obj.name = "test";

                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_COMPLEX_0200
         * @tc.name testEqualsWithArrayObject
         * @tc.desc Test Message.equals with array object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsWithArrayObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithArrayObject';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const arr: Array<int> = [1, 2, 3, 4, 5];
                    const msg1 = new concurrency.Message(what, arr, handler);
                    const msg2 = new concurrency.Message(what, arr, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_EDGE_0100
         * @tc.name testEqualsWithNullObj
         * @tc.desc Test Message.equals when obj is null or undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsWithNullObj", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithNullObj';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_EDGE_0200
         * @tc.name testEqualsWithNegativeWhat
         * @tc.desc Test Message.equals with negative what value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsWithNegativeWhat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithNegativeWhat';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = -1;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_EDGE_0300
         * @tc.name testEqualsWithLargeWhat
         * @tc.desc Test Message.equals with large what value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsWithLargeWhat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithLargeWhat';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 999999;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_MIXED_0100
         * @tc.name testEqualsMixedTypes
         * @tc.desc Test Message.equals with mixed message types returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testEqualsMixedTypes", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsMixedTypes';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback = (): void => {
                        console.info("callback");
                    };

                    const msg1 = new concurrency.Message(1, "hello", handler);
                    const msg2 = new concurrency.Message(callback, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_SELF_0100
         * @tc.name testEqualsWithSelf
         * @tc.desc Test Message.equals with self comparison
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithSelf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithSelf';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg = new concurrency.Message(1, "test", handler);

                    const result = msg.equals(msg);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_STRING_0100
         * @tc.name testEqualsWithEmptyString
         * @tc.desc Test Message.equals with empty string object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithEmptyString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithEmptyString';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: string = "";
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_MESSAGE_EQUALS_STRING_0200
         * @tc.name testEqualsWithLongString
         * @tc.desc Test Message.equals with long string object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testEqualsWithLongString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEqualsWithLongString';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    let obj: string = "";
                    for (let i = 0; i < 100; i++) {
                        obj += "test";
                    }

                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });
    })
}
