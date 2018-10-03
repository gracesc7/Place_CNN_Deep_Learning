# Place_CNN_Deep_Learning

**Motivations:**
The spatial hierarchical structure of CNNs mimic the receptive fields of neurons in brain regions organized along a similar hierarchy in humans. What can Convolutional Neural Networks tell us about brain function?

**Questions:**
Humans are very good at distinguishing Good examplars from Bad exemplars of natural scenes. Human fMRI studies, show distinct differences in various brain regions in decoding scene category for good and bad exemplars. Do we see similar pattern of results if we decode good and bad scenes in CNNs?

**Approach:**
- Analyzed natural scene images from 6 categories: Beaches, City Streets, Forests, Highways, Mountains and Offices
- Good and Bad Exemplars rated for category representativeness on Amazon Turk
- Pre-trained PlacesCNN (Zhou et al.,2014), Pycaffe
- Extracted features for layer conv1 to fc7
- Classifications: Good VS Bad classificatoin and Six-way category classification
- Anaconda, Jupyter Notebook, Cuda

**Acknowledgement:**
I would like to thank my research mentor Manoj Kumar for his patient and consistent mentorship on this research. 

**Reference:**
[1] B. Zhou, A. Lapedriza, J. Xiao, A. Torralba, and A. Oliva. (2014). “Learning Deep Features for Scene Recognition using Places Database.” Advances in Neural Information Processing Systems 27 (NIPS).


