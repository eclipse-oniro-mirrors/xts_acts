/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import {
  FourthLevelSendableClassOver,
  InheritedSendableClass,
  SendableConstEnum,
  SendableFiveAttributeInheritClassLevelThree,
  SendableFourAttributeClass,
  topLevelInstance
} from '../test/tripleInheritanceTaskPool';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.info('Worker received message:', e.data);
  switch (e.data) {
    case 'testTripleInheritanceWorker0001': {
      const instance = new SendableFiveAttributeInheritClassLevelThree();
      let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
      const newNumber = 100;
      instance.setMyNumber(newNumber);
      let res2 = instance.myNumber === newNumber + 10;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testTripleInheritanceWorker0002': {
      const instance = new SendableFiveAttributeInheritClassLevelThree();
      let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
      instance.setMyTopLevelClassInstance(topLevelInstance);
      let res2 = instance.myTopLevelClassInstance === topLevelInstance;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testTripleInheritanceWorker0003': {
      const instance = new SendableFiveAttributeInheritClassLevelThree();
      let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
      instance.setMyEnum(SendableConstEnum.OPTION_2);
      let res2 = instance.myEnum === SendableConstEnum.OPTION_2;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testTripleInheritanceWorker0004': {
      const instance = new SendableFiveAttributeInheritClassLevelThree();
      let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
      instance.setMyArray([1, 2, 3]);
      let res2 = instance.myArray.toString() === '1,2,3';
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testTripleInheritanceWorker0005': {
      const instance = new SendableFiveAttributeInheritClassLevelThree();
      let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
      const lockName = 'testLock';
      instance.setMyAsyncLock(lockName);
      let res2 = instance.myAsyncLock.name === lockName;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testSendableFourAttributeClassWorker0001': {
      const instance = new SendableFourAttributeClass();
      let res1 = instance instanceof SendableFourAttributeClass;
      const newNumber = 88;
      instance.setMyNumber(newNumber);
      let res2 = instance.getMyNumber() === newNumber;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testSendableFourAttributeClassWorker0002': {
      const instance = new SendableFourAttributeClass();
      let res1 = instance instanceof SendableFourAttributeClass;
      instance.setMyEnum(SendableConstEnum.OPTION_2);
      let res2 = instance.getMyEnum() === SendableConstEnum.OPTION_2;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testSendableFourAttributeClassWorker0003': {
      const instance = new SendableFourAttributeClass();
      let res1 = instance instanceof SendableFourAttributeClass;
      instance.setMyArray([4, 5, 6]);
      let res2 = instance.getMyArray().toString() === '4,5,6';
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testSendableFourAttributeClassWorker0004': {
      const instance = new SendableFourAttributeClass();
      let res1 = instance instanceof SendableFourAttributeClass;
      const lockName = 'newLock';
      instance.setMyAsyncLock(lockName);
      let res2 = instance.getMyAsyncLock().name === lockName;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testSendableFourAttributeClassWorker0005': {
      const instance = new SendableFourAttributeClass();
      let res1 = instance instanceof SendableFourAttributeClass;
      const inheritedInstance = new InheritedSendableClass();
      inheritedInstance.setInheritedProperty('customValue');
      instance.setMyInheritedClass(inheritedInstance);
      let res2 = instance.getMyInheritedClass().getInheritedProperty() === 'customValue';
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0001': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      const expectedString = 'Person[name=piter, age=18]';
      let res2 = instance.toString() === expectedString;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0002': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      const myNumber = 42;
      instance.setMyNumber(myNumber);
      let res2 = instance.myNumber === myNumber + 10;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0003': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      instance.setMyEnum();
      let res2 = instance.myEnum === SendableConstEnum.OPTION_2;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0004': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      instance.setMyArray([10, 20, 30]);
      let res2 = instance.myArray.toString() === '10,20,30';
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0005': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      const lockName = 'fourthLevelLock';
      instance.setMyAsyncLock(lockName);
      let res2 = instance.myAsyncLock.name === lockName;
      workerPort.postMessage(res1 && res2);
      break;
    }
    case 'testFourthLevelSendableClassOverWorker0006': {
      const instance = new FourthLevelSendableClassOver('piter', 18);
      let res1 = instance instanceof FourthLevelSendableClassOver;
      const inheritedInstance = new InheritedSendableClass();
      inheritedInstance.setInheritedProperty('customValue');
      instance.setMyInheritedClass(inheritedInstance);
      let res2 = instance.getMyInheritedClass().getInheritedProperty() === 'customValue';
      workerPort.postMessage(res1 && res2);
      break;
    }
    default:
      break;
  }
};