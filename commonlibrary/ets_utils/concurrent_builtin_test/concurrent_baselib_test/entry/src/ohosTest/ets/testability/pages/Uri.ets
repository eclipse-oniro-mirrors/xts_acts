import { uri } from '@kit.ArkTS';
import { str2, str2Decode, str3, str3Decode } from './Testxml';

@Concurrent
export function testUriEqualsTo() {
  const caseName = 'testEqualsToSpecialSymbolsHostStr2vsStr30001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:password@host' + str2 + ':8080/directory/file/?key1=value1#qwer=da';
    const uri2 = 'https://username:password@host' + str3 + ':8080/directory/file/?key1=value1#qwer=da';
    let uriInstance1 = new uri.URI(uri1);
    let uriInstance2 = new uri.URI(uri2);
    let result1 = uriInstance1.equalsTo(uriInstance2);
    if (result1 !== false) {
      throw new Error(`${caseName} equalsTo result mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testCheckIsAbsolute() {
  const caseName = 'testCheckIsAbsoluteSpecialSymbolsHostStr20001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:password@host' + str2 + ':8080/directory/file/?key1=value1#qwer=da';
    let uriInstance = new uri.URI(uri1);
    let result1 = uriInstance.checkIsAbsolute();
    if (result1 !== true) {
      throw new Error(`${caseName} checkIsAbsolute result mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriNormalize() {
  const caseName = 'testNormalizeSpecialSymbolsValueStr20001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:password@host:8080/directory/file?key1' + str3 + '=value1#qwer=da';
    let uriInstance = new uri.URI(uri1);
    let result1 = uriInstance.normalize().query;
    if (result1 !== 'key1' + str3Decode + '=value1') {
      throw new Error(`${caseName} normalize query mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriToString() {
  const caseName = 'testToStringSpecialSymbolsHostStr20001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:password@host:8080/directory/file?key1' + str2 + '=pppppp&qwer=da';
    let result = new uri.URI(uri1);
    let result1 = result.toString();
    if (result1 !== uri1) {
      throw new Error(`${caseName} toString mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriCreateFromParts() {
  const caseName = 'testCreateFromPartsSpecialSymbolsScheme0002';
  try {
    console.log(`${caseName} test start`);
    const uriInstance = uri.URI.createFromParts('mailto-+.test0002', 'no body', 'top');
    const result1 = uriInstance.toString();
    const expected = 'mailto-+.test0002:no%20body#top';
    if (result1 !== expected) {
      throw new Error(`${caseName} createFromParts result mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriGetQueryValue() {
  const caseName = 'testGetQueryValueSpecialSymbolsKeyStr20001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = `https://username:password@host:8080/directory/file?key1${str2}=true&key1${str2}=value2#qwer=da`;
    const uriInstance = new uri.URI(uri1);
    const result1 = uriInstance.getBooleanQueryValue('key1' + str2Decode, false);
    if (result1.toString() !== 'true') {
      throw new Error(`${caseName} getQueryValue mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriFragmentPercentEncoded() {
  const caseName = 'testFragment0006';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#frag%3Dment';
    const uriInstance = new uri.URI(uri1);
    ;
    const result = uriInstance.fragment;
    if (result !== 'frag=ment') {
      throw new Error(`${caseName} fragment mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriAuthorityWithDoubleAt() {
  const caseName = 'testAuthority0001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:password@@host:8080/directory/file?foo=1&bar=2#fragment';
    const uriInstance = new uri.URI(uri1);
    const result = uriInstance.authority;
    if (result !== 'username:password@@host:8080') {
      throw new Error(`${caseName} authority mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriSSPWithLeadingSlashes() {
  const caseName = 'testSsp0001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'www.abc.com:::8080/directory/file?ab=pppppp#qwer=da';
    const uriInstance = new uri.URI(uri1);
    const result = uriInstance.ssp;
    if (result !== '::8080/directory/file?ab=pppppp') {
      throw new Error(`${caseName} ssp mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriEncodedUserInfoWithDoubleColon() {
  const caseName = 'testEncodedUserInfo0001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username::my+name@host:8080/directory/my+file?foo=1&bar=2#fragment';
    const uriInstance = new uri.URI(uri1);
    const result = uriInstance.encodedUserInfo;
    if (result !== 'username::my+name') {
      throw new Error(`${caseName} encodedUserInfo mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriEncodedPathWithMultipleSlashes() {
  const caseName = 'testEncodedPath0002';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:my+name@host:8080/directory///my+file?foo=1&bar=2#fragment';
    const uriInstance = new uri.URI(uri1);
    const result = uriInstance.encodedPath;
    if (result !== '/directory///my+file') {
      throw new Error(`${caseName} encodedPath mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testUriEncodedQueryWithDoubleQuestion() {
  const caseName = 'testEncodedQuery0001';
  try {
    console.log(`${caseName} test start`);
    const uri1 = 'https://username:my+name@host:8080/directory/my+file??foo=1&bar=2#fragment';
    const uriInstance = new uri.URI(uri1);
    const result = uriInstance.encodedQuery;
    if (result !== '?foo=1&bar=2') {
      throw new Error(`${caseName} encodedQuery mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}