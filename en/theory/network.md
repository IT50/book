# Network

Networks, like data, are built on the concept of abstraction. There are many abstract layers in a network. In one layer we only care about communicating the two devices directly connected to each other, while in another layer we have all the machines on the network directly accessible. This layer structure allows for universal compatibility with various technologies, because a technology only belongs to one of the layers.

Before diving into those, here are some concepts that apply to multiple layers.

- *Protocol.* **Protocols** are guidelines of communication in a layer. They specify rules about sending, receiving, and interpreting data.

- *Packet.* When transferring continuous data, it is constructed into many small chunks called **packets**, each with some kind of identification. Two senses of the packet concept exist in different layers. In the transport layer, packets are of a transport layer protocol, and these packets get delivered all across the network. In the data link layer, packets are of a data link protocol communicating two devices that are directly connected together.

## The OSI Model

[ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization) has developed a generally accepted standard layer architecture called the [OSI model](https://en.wikipedia.org/wiki/OSI_model). There are 7 layers in total.

Layer | Name
--|-----------
7 | Application
6 | Presentation
5 | Session
4 | Transport
3 | Network
2 | Data Link
1 | Physical

But don’t worry about the number of layers here. As a professional user, you only need to learn about three of them: layers 2, 3 and 4. Above these layers, things mostly depend on the implementation of the software, unrelated to the universal knowledge of computer networks. Down below, layer 1 is just hardware.

Below, all layers are briefly introduced from top to bottom, and important layers will be elaborated in separated chapters.

### Application Layer

This is the layer where useful software interact compatibly. It has the protocols we use every day, such as HTTP, FTP, and DNS.

### Presentation Layer & Session Layer

In these two layers, continuous and complete data of the above protocols are constructed from the small packets in the transport layer.

In many practices, these two layers are merged into the application layer.

### Transport Layer

There are two main protocols in this layer: **TCP** and **UDP**, all over IP. They have different usage scenarios, and we will elaborate them in separate chapters.

The continuous data from the layers above are constructed into smaller packets in this layer, so they can be individually exchanged, with only the necessary packets resent if some get corrupted or lost.

### Network Layer

The universal protocol in this layer is the **Internet Protocol** (**IP**). You may have heard of an “IP address”, and that “IP” is what we are talking about here.

This layer is where a computer network looks like a network (graph) where computers are **nodes** (vertices) and connections are **edges**. A packet will travel many different nodes and edges before arriving at the destination node, and it is up to the network layer to determine the path.

### Data Link Layer

This layer deals with two nodes that are physically connected together. Two well-known protocols in this layer are Ethernet and Wi-Fi.

We only need to know a few key features of this layer.

### Physical Layer

It’s literally the “physical” layer. Data in this layer is just voltage pulses, light, and electromagnetic waves. Common link media include copper wire, optical fiber, and wireless signals.
