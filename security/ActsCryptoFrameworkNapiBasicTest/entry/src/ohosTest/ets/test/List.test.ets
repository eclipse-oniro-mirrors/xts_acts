import cryptoFrameworkAgreementTest from './CryptoFrameworkAgreementTest.test';
import cryptoFrameworkAsymCipherTest from './CryptoFrameworkAsymCipherTest.test';
import cryptoFrameworkAsymKey2Test from './CryptoFrameworkAsymKey2Test.test';
import cryptoFrameworkAsymKeyTest from './CryptoFrameworkAsymKeyTest.test';
import cryptoFrameworkDigestTest from './CryptoFrameworkDigestTest.test';
import cryptoFrameworkKdfTest from './CryptoFrameworkKdfTest.test';
import cryptoFrameworkMacTest from './CryptoFrameworkMacTest.test';
import cryptoFrameworkRandomTest from './CryptoFrameworkRandomTest.test';
import cryptoFrameworkReinforcementTest from './CryptoFrameworkReinforcementTest.test';
import cryptoFrameworkSignature2Test from './CryptoFrameworkSignature2Test.test';
import cryptoFrameworkSignatureTest from './CryptoFrameworkSignatureTest.test';
import cryptoFrameworkSymCipherTest from './CryptoFrameworkSymCipherTest.test';
import cryptoFrameworkSymKeyTest from './CryptoFrameworkSymKeyTest.test';
import cryptoFrameworkVerifyTest from './CryptoFrameworkVerifyTest.test';

export default function testsuite() {
  cryptoFrameworkAgreementTest();
  cryptoFrameworkAsymCipherTest();
  cryptoFrameworkAsymKey2Test();
  cryptoFrameworkAsymKeyTest();
  cryptoFrameworkDigestTest();
  cryptoFrameworkKdfTest();
  cryptoFrameworkMacTest();
  cryptoFrameworkRandomTest();
  cryptoFrameworkReinforcementTest();
  cryptoFrameworkSignature2Test();
  cryptoFrameworkSignatureTest();
  cryptoFrameworkSymCipherTest();
  cryptoFrameworkSymKeyTest();
  cryptoFrameworkVerifyTest()
}