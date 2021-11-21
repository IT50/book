# Network

Networks, like data, are built on the concept of abstraction. There are many abstract layers in a network, and this enables professionals to focus on their own layer and not to worry about things happen in other layers.

Since the layers are completely abstract, there can be many possible layer architectures. However, in real life, people expect distinct devices can communicate with each other through the networks. Then here comes the standard. 

But before diving into the layer stuff, you will need to learn some basic terminology.

## Internet

We are not giving a definition but giving a description here.

Internet is a giant "web" connected by physical links and nodes. Links are often some kinds of cables. Nodes can be your computers, your WiFi routers, or servers of your ISP (Internet Service Provider, for example, AT&T).

Nodes send and receive data transferred by links, and most of the time, the data travel through many nodes then eventually arrive at the destination node. 

## Protocol

Protocols are like guidelines about how to communicate. 

How to send the data? How to receive the data? How to read the data? And how to recover corrupted data? 

Protocols are here to solve these questions.

We can't just send a bunch of 0s and 1s to another computer as we want. Distinct devices will need some common protocols to transfer data properly and reliably.

## Packet

When transferring data from a source node to a destination node, people need a structured and easy-understanding way to interact with the data, which are de facto streams of 0s and 1s in the lowest physical level.

Therefore, each layer will store data into many small chunks, and this chuck of data is called "packet". Each layer has different *protocols* to interact with the packets.

Instead of using the same term "packet" in all layers, some academic textbooks will use different terms for the "packet" in different layers to make it more clear. In IT50, for simplicity, we will just use "packet" throughout all layers.

## OSI Model

Some people from [ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization) developed a generally accepted standard layer architecture, which is called [OSI model](https://en.wikipedia.org/wiki/OSI_model#Layer_6:_Presentation_Layer).

There are 7 layers in total, listed in the table below.

Layer | Name
----------|-----------
7th Layer | Application
6th Layer | Presentation
5th Layer | Session
4th Layer | Transport
3rd Layer | Network
2nd Layer | Data Link
Base Layer | Physical

But don’t worry, average users will only need to know 2~3 layers. That’s the reason for building such an abstract layer structure!

In this overview page, all layers will be briefly introduced from top to bottom, and some layers will be elaborated in separated pages.

### Application Layer

This is the superficial layer with which most software interacts. It has many useful protocols which we are using every day, like HTTP, FTP, and DNS. When sending packets, those packets will be passed down to a lower layer.

### Presentation Layer & Session Layer

In reality, the implementation of these two layer have already been merged into the application layer. Thus, we don't need to care much about these two layers.

### Transport Layer

There are two main protocols in this layer, one is TCP and another is UDP. They have different usage scenarios, and we will elaborate them in separate pages.

The packets from the upper application layer are reconstructed into TCP packets or UDP packets in this layer.

### Network Layer

The main protocol in this layer is IP protocol. You may have heard of "IP address", and that "IP" is what we are talking about here.

TCP and UDP packets are reconstructed into IP packets in this layer and sent to destination node.

As we mentioned before, the data will travel many different nodes and links before arriving at the destination node, so there is a need to determine the path. We can't just let our data get lost in the Internet, right?

Therefore, beside the IP protocol, there are many other protocols which are designed to navigate the IP packets in this layer.

### Data Link Layer

This layer deals with the nodes that are physically connected together. 

Two common protocols in this layer are Ethernet and WiFi.

We don't need to know details of this layer, since it's close to the lowest physical layer. We only need to know how to use it, and that's enough.

### Physical Layer

It’s literally the “physical” layer, and as described in Data section of IT50, the physical link in this layer transport 0s and 1s from a source node to a destination node. Some common link media are copper wire, coaxial cable, and fiber-optic cable.

We don't need go into details of this layer, either.