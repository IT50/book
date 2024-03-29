# 非对称密码学

非对称加密有一对密钥。当其中一个密钥被用来加密数据时，只有另一个密钥可以被用来解密。请记住，发送方知道原始数据。

通常情况下，一个密钥是公开的，被称作公钥；另一个密钥是保密的，被称作私钥。这种设计允许安全的通信。

## 理想工作流程

- 每个人都知道其他人的公钥。
- Alice 拥有原始数据。
- Alice 用 Bob 的公钥对原始数据进行加密。
- Alice 将加密后的数据发送给 Bob。
- Bob 用他的私钥对数据进行解密。
- Bob 拥有原始数据。

请注意，Alice 并没有用自己的私钥进行加密，否则任何能接触到加密数据的人都能解密它。

然而，在现实世界中，要知道每个人的公钥是不现实的。密钥必须在连接开始时共享。在这种情况下，连接承担者总是可以进行**中间人**（man-in-the-middle，MITM）攻击。下一节将说明这种攻击是如何进行的。目前世界上有一种广泛使用的（而且是**可靠**的）防止 MITM 攻击的方法，我们将在 [信任链]() 一章中讨论这个问题。

## 具有实时密钥共享和中间人攻击的工作流程

- Alice 拥有原始数据。
- Alice 要求 Bob 提供他的公钥，这个请求最后落到了 Charles 的手里。
- Charles 要求 Bob 提供他的公钥。鲍勃用他的公钥回应。
- Charles 用他自己的公钥回应 Alice。
- Alice 用 Charles 的公钥对原始数据进行加密。
- Alice 将加密后的数据发送给 Bob，最后落到了 Charles 的手中。
- Charles 用他的私钥对数据进行解密。
- Charles 拥有原始数据。
- Charles 可以选择修改原始数据。
- Charles 用 Bob 的公钥对原始数据进行加密。
- Bob 用他的私钥对数据进行解密。
- Bob 拥有（可能被 Charles 修改过的）原始数据。

## 签名

在上述内容中，我们讨论的都是非对称密码学在加密方面的应用。现在，我们要开始讨论**签名**（signing）以及非对称密码学在其中发挥的作用。

签名是一种用来验证文件的创作者的方法。签名的过程和加密类似，验证签名的过程与解密类似。

### 理想工作流程

- Alice 拥有一份文件。
- Alice 用自己的私钥对文件签名。
- Alice 将签名后的文件发送给 Bob。
- Bob 用 Alice 的公钥验证这个文件。
- Bob 拥有原始文件。

在实际应用中，一般对文件的哈希（参见 [密码学哈希](./cryptographic-hash)）进行签名，再将签名后的的文件哈希与原始文件一并发送。