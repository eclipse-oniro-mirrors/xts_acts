'use static'
import { add, TAG, waitForSeconds } from './Testxml';



export async function testSetTimer001() {
  const caseName = 'testSetTimer001';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    setTimeout(() => {
      count++;
    }, 100);
    await waitForSeconds(200);
    if (count !== 1) {
      console.info('===========',count)
      throw new Error(`${TAG} count !== 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetTimer002() {
  const caseName = 'testSetTimer002';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    setTimeout(() => {
      if (count !== 0){
        throw new Error(`${TAG} count !== 0`);
      }
      count++;
      if (count !== 1){
        throw new Error(`${TAG} count !== 1`);
      }
    }, 100);
    await waitForSeconds(100);
    if (count !== 1) {
      throw new Error(`${TAG} final count !== 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetTimer003() {
  const caseName = 'testSetTimer003';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    const add = () => { count++; };
    const result1 = setTimeout(() => { add(); });
    const result2 = setTimeout(() => { add(); add(); add(); });
    await waitForSeconds(300);
    if (result1 === undefined){
      throw new Error(`${TAG} result1 === undefined`);
    }
    if (result2 === undefined) {
      throw new Error(`${TAG} result2 === undefined`);
    }
    if (count !== 4) {
      throw new Error(`${TAG} count !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetTimer004() {
  const caseName = 'testSetTimer004';
  try {
    console.log(`${caseName} test start`);
    let flag = 'a';
    const result1 = setTimeout(() => { flag = 'b'; });
    await waitForSeconds(100);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetTimer005() {
  const caseName = 'testSetTimer005';
  try {
    console.log(`${caseName} test start`);
    let flag = 'a';
    const result1 = setTimeout(() => { flag = 'b'; });
    await waitForSeconds(100);
    if (flag !== 'b') {
      throw new Error(`${TAG} flag !== 'b'`);
    }
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testClearTimer001() {
  const caseName = 'testClearTimer001';
  try {
    console.log(`${caseName} test start`);
    const result1 = setTimeout(() => {},);
    const result2 = setTimeout(() => {},);
    await waitForSeconds(100);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    if (result2 === undefined) {
      throw new Error(`${TAG} result2 === undefined`);
    }
    clearTimeout(result1);
    clearTimeout(result2);
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetInterval001() {
  const caseName = 'testSetInterval001';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    const add = () => { count++; };
    count = 0;
    const result1 = setInterval(() => { add(); }, 1500);
    await waitForSeconds(2000);
    clearInterval(result1);
    if (count !== 1) {
      throw new Error(`${TAG} count !== 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetInterval002() {
  const caseName = 'testSetInterval002';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    const add = () => { count++; };
    count = 0;
    const result1 = setInterval(() => { add(); }, 90);
    await waitForSeconds(300);
    clearInterval(result1);
    if (count !== 3) {
      throw new Error(`${TAG} count !== 3`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetInterval003() {
  const caseName = 'testSetInterval003';
  try {
    console.log(`${caseName} test start`);
    let count: int = 0;
    const add = () => { count++; };
    count = 0;
    const result1 = setInterval(() => { add(); }, 90);
    const result2 = setInterval(() => { add(); add(); add(); }, 90);
    await waitForSeconds(300);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    if (result2 === undefined) {
      throw new Error(`${TAG} result2 === undefined`);
    }
    clearInterval(result1);
    clearInterval(result2);
    if (count !== 12) {
      throw new Error(`${TAG} count !== 12`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetInterval004() {
  const caseName = 'testSetInterval004';
  try {
    console.log(`${caseName} test start`);
    let flag = 'a';
    const result1 = setInterval(() => { flag = 'b'; }, 70);
    await waitForSeconds(100);
    clearInterval(result1);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    if (flag !== 'b') {
      throw new Error(`${TAG} flag !== 'b'`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testSetInterval005() {
  const caseName = 'testSetInterval005';
  try {
    console.log(`${caseName} test start`);
    let flag = 'a';
    const result1 = setInterval(() => { flag = 'b'; }, 70);
    await waitForSeconds(100);
    clearInterval(result1);
    if (flag !== 'b') {
      throw new Error(`${TAG} flag !== 'b'`);
    }
    const result2 = setInterval(() => { flag = 'c'; }, 250);
    await waitForSeconds(400);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }

    if (result2 === undefined) {
      throw new Error(`${TAG} result2 === undefined`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export async function testClearInterval001() {
  const caseName = 'testClearInterval001';
  try {
    console.log(`${caseName} test start`);
    const result1 = setInterval(() => {}, 100);
    const result2 = setInterval(() => {}, 100);
    await waitForSeconds(100);
    if (result1 === undefined) {
      throw new Error(`${TAG} result1 === undefined`);
    }
    if (result2 === undefined) {
      throw new Error(`${TAG} result2 === undefined`);
    }
    clearInterval(result1);
    clearInterval(result2);
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

